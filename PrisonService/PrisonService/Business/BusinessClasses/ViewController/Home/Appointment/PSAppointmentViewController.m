//
//  PSAppointmentViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAppointmentViewController.h"
#import "FSCalendar.h"
#import "PSDateView.h"
#import "NSDate+Components.h"
#import "PSLastCallInfoCell.h"
#import "PSAppointmentDetailCell.h"
#import "PSAppointmentInstructionCell.h"
#import "PSAlertView.h"
#import "PSTipsConstants.h"
#import "PSCartViewController.h"
#import "PSSessionManager.h"
#import "PSIMMessageManager.h"
#import "NSString+Date.h"
#import "PSFaceAuthViewController.h"
#import "AccountsViewModel.h"
#import "PSInstructionsDataView.h"
#import "PSPrisonerFamilesViewController.h"
#import "PSPrisonerFamliesViewModel.h"
#import "PSPrisonerFamily.h"

@interface PSAppointmentViewController ()<FSCalendarDataSource,FSCalendarDelegate,UITableViewDataSource,UITableViewDelegate,PSIMMessageObserver,PSSessionObserver>

@property (nonatomic, strong) FSCalendar *calendar;
@property (nonatomic, strong) PSDateView *dateView;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UITableView *appointmentTableView;
@property (nonatomic,assign) CGFloat Balance;
@property (nonatomic , strong) NSArray *selectArray;
@property (nonatomic , strong) NSMutableArray *meetingMembersArray;
@property (nonatomic , strong) PSPrisonerFamily*familyModel ;


@end

@implementation PSAppointmentViewController
- (instancetype)initWithViewModel:(PSViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        NSString*family_phone=NSLocalizedString(@"family_phone", @"亲情电话");
        self.title = family_phone;
        [[PSIMMessageManager sharedInstance] addObserver:self];
        [[PSSessionManager sharedInstance] addObserver:self];
    }
    return self;
}

- (void)dealloc {
    [[PSIMMessageManager sharedInstance] removeObserver:self];
    [[PSSessionManager sharedInstance] removeObserver:self];
    self.selectArray=nil;
}

- (void)appointmentAction {
    
    PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
    [[PSLoadingView sharedInstance] show];

    for (int i=0; i<self.selectArray.count; i++) {
        PSPrisonerFamily*familesModel=self.selectArray[i];
        if ([familesModel.familyName isEqualToString:[PSSessionManager sharedInstance].session.families.name]) {
            self.familyModel=self.selectArray[i];
        }
    }
    NSLog(@"%@",self.familyModel);
    [self.meetingMembersArray removeAllObjects];
    for (int i=0; i<self.selectArray.count; i++) {
        PSPrisonerFamily*familyModel=self.selectArray[i];
        NSDictionary*arrayDic=@{@"familyId":familyModel.familyId};
        [self.meetingMembersArray addObject:arrayDic];
    }
    NSLog(@"远程视频会见数组||%@",self.meetingMembersArray);
    appointmentViewModel.familyId=_familyModel.familyId;
    appointmentViewModel.applicationDate=[self.calendar.selectedDate yearMonthDay];
    appointmentViewModel.prisonerId=_familyModel.prisonerId;
    appointmentViewModel.charge=[NSString stringWithFormat:@"%.2f",appointmentViewModel.jailConfiguration.cost];
    appointmentViewModel.jailId=_familyModel.jailId;
    appointmentViewModel.meetingMembers=self.meetingMembersArray;
    @weakify(self)
    [appointmentViewModel addMeetingWithDate:self.calendar.selectedDate completed:^(PSResponse *response) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        if (response.code == 200) {
            NSString*apply_success=NSLocalizedString(@"apply_success", @"会见申请成功");
            [PSTipsView showTips:apply_success];
            [self refreshData:YES];
           
        }else{
            [PSAlertView showWithTitle:nil message:response.msg messageAlignment:NSTextAlignmentCenter image:nil handler:^(PSAlertView *alertView, NSInteger buttonIndex) {
                
            } buttonTitles:@"取消",@"确定", nil];
            //[PSTipsView showTips:response.msg ? response.msg : @"预约失败"];
        }
    } failed:^(NSError *error) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        [self showNetError];
        
    }];
}



- (void)checkFaceAuth {
    PSFaceAuthViewController *authViewController = [[PSFaceAuthViewController alloc] initWithViewModel:nil];
    [authViewController setCompletion:^(BOOL successful) {
        if (successful) {
            [self appointmentAction];
        }
        [self.navigationController popViewControllerAnimated:NO];
    }];
    [self.navigationController pushViewController:authViewController animated:NO];
}

- (void)handleAppointmentApply {
    PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
    if ([appointmentViewModel.jailConfiguration.face_recognition isEqualToString:@"0"]) {
        [self appointmentAction];
    }else{
        [self checkFaceAuth];
    }
     //[self appointmentAction];
}

-(void)addPrisonerFamliesAction{
    self.selectArray=nil;
     PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
    PSPrisonerFamliesViewModel *prisonerFamliesViewModel = [[PSPrisonerFamliesViewModel alloc]init];
 prisonerFamliesViewModel.face_recognition=appointmentViewModel.jailConfiguration.face_recognition;
    PSPrisonerFamilesViewController*familesViewController=[[PSPrisonerFamilesViewController alloc]initWithViewModel:prisonerFamliesViewModel];
    familesViewController.returnValueBlock = ^(NSArray *arrayValue) {
        self.selectArray=arrayValue;
         NSLog(@"arrayValue:%@",self.selectArray);
    };
    
    [familesViewController setCompletion:^(BOOL successful) {
        if (successful) {
            //[self appointmentAction];
            [self applyAction];
        }
    }];
    
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:familesViewController animated:YES];
   
}

- (void)applyAction {
    PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
    CGFloat price = appointmentViewModel.phoneCard.price;
    if (price-self.Balance>0.0000001) {
        [PSAlertView showWithTitle:nil message:[NSString stringWithFormat:@"申请本次会见需要%.2f元，您的余额不足请充值",price] messageAlignment:NSTextAlignmentCenter image:nil handler:^(PSAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                [self buyCardAction];
            }
        } buttonTitles:@"取消",@"确定", nil];
    }else{
         NSString*notice_title=NSLocalizedString(@"notice_title", @"提请注意");
        NSString*notice_agreed=NSLocalizedString(@"notice_agreed", @"同意");
        NSString*notice_disagreed=NSLocalizedString(@"notice_disagreed", @"不同意");
        NSString*apply_content=NSLocalizedString(@"apply_content", @"您预约%@与%@进行远程视频会见,按约定,本次会见支付人民币%.2f元,系统将从亲情余额中自动扣除");
        //[self.calendar.selectedDate yearMonthDayChinese]
        [PSAlertView showWithTitle:notice_title message:[NSString stringWithFormat:apply_content,[self.calendar.selectedDate yearMonthDay],appointmentViewModel.prisonerDetail.name,price] messageAlignment:NSTextAlignmentCenter image:nil handler:^(PSAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                [self handleAppointmentApply];
            }
        } buttonTitles:notice_disagreed,notice_agreed, nil];
    }
}

- (void)helpAction {
    NSString*usehelp=NSLocalizedString(@"UseHelp", "使用说明");
    NSString*Directions_for_use=NSLocalizedString(@"Directions_for_use", @"使用说明");
    NSString*determine=NSLocalizedString(@"determine", @"确定");
    [PSAlertView showWithTitle:Directions_for_use message:usehelp messageAlignment:NSTextAlignmentLeft image:nil handler:^(PSAlertView *alertView, NSInteger buttonIndex) {
        
    } buttonTitles:determine, nil];
}

- (void)buyCardAction {
    PSCartViewController *cartViewController = [[PSCartViewController alloc] initWithViewModel:[PSCartViewModel new]];
    [self.navigationController pushViewController:cartViewController animated:YES];
}

- (void)handleMeetingStatusMessage:(PSMeetingMessage *)message {
    if (message.status.length > 0 && message.meeting_time.length >= 10) {
        PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
        NSString *meetingDateString = [message.meeting_time substringToIndex:10];
        NSDate *meetingDate = [meetingDateString stringToDateWithFormat:@"yyyy-MM-dd"];
        PSMeeting *meeting = [appointmentViewModel meetingOfDate:meetingDate];
        if (meeting) {
            meeting.status = message.status;
            meeting.meetingTime = message.meeting_time;
            [appointmentViewModel updateMeetingsOfYearMonth:meetingDate.yearMonth];
            if ([meetingDate.yearMonth isEqualToString:self.calendar.currentPage.yearMonth]) {
                [self.calendar reloadData];
                [self.appointmentTableView reloadData];
            }
        }
    }
}

- (void)refreshData:(BOOL)force {
    PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
    @weakify(self)
    [appointmentViewModel requestMeetingsOfYearMonth:[self.calendar.currentPage yearMonth] force:force completed:^(id data) {
        @strongify(self)
        if ([data isKindOfClass:[NSDictionary class]]) {
            if ([data count] > 0) {
                [self.calendar reloadData];
            }
            [self.appointmentTableView reloadData];
        }
    }];
}

- (void)renderContents {
    UIColor *topColor = UIColorFromHexadecimalRGB(0x264c90);
    self.dateView = [PSDateView new];
    self.dateView.backgroundColor = topColor;
    [self.view addSubview:self.dateView];
    [self.dateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    NSArray *langArr = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSString *language = langArr.firstObject;
    self.calendar = [[FSCalendar alloc] initWithFrame:CGRectZero];
    self.calendar.dataSource = self;
    self.calendar.delegate = self;
    //self.calendar.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
     self.calendar.locale = [NSLocale localeWithLocaleIdentifier:language];
    self.calendar.headerHeight = 0;
    self.calendar.weekdayHeight = 30;
    self.calendar.appearance.weekdayTextColor = [UIColor whiteColor];
    self.calendar.appearance.weekdayFont = FontOfSize(13);
    self.calendar.appearance.titleFont = FontOfSize(13);
    self.calendar.appearance.subtitleFont = FontOfSize(8);
    self.calendar.appearance.titleTodayColor = [UIColor whiteColor];
    self.calendar.appearance.titlePlaceholderColor =AppBaseTextColor2;
    self.calendar.appearance.todayColor = topColor;
    self.calendar.appearance.selectionColor = AppBaseTextColor1;
    self.calendar.calendarWeekdayView.backgroundColor = topColor;
    [self.view insertSubview:self.calendar belowSubview:self.dateView];
    [self.calendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.dateView.mas_bottom).offset(-1);
        make.height.mas_equalTo(260);
    }];
    NSDate *todayNext = [self.calendar.today dateByAddingTimeInterval:24 * 60 * 60];
    [self.calendar selectDate:todayNext];
    [self.dateView setNowDate:self.calendar.today selectedDate:self.calendar.selectedDate];
    UIButton *applyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [applyButton addTarget:self action:@selector(requsetPhoneCardBalance) forControlEvents:UIControlEventTouchUpInside];
    applyButton.titleLabel.font = AppBaseTextFont1;
    UIImage *bgImage = [UIImage imageNamed:@"universalBtGradientBg"];
    [applyButton setBackgroundImage:bgImage forState:UIControlStateNormal];
    [applyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NSString*Application_familyPhone=NSLocalizedString(@"Application_familyPhone", @"申请亲情电话");
    [applyButton setTitle:Application_familyPhone forState:UIControlStateNormal];
    [self.view addSubview:applyButton];
    [applyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-20);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(bgImage.size);
    }];
    self.appointmentTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.appointmentTableView.dataSource = self;
    self.appointmentTableView.delegate = self;
    self.appointmentTableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    self.appointmentTableView.tableFooterView = [UIView new];
    [self.appointmentTableView registerClass:[PSAppointmentDetailCell class] forCellReuseIdentifier:@"PSAppointmentDetailCell"];
    [self.appointmentTableView registerClass:[PSAppointmentInstructionCell class] forCellReuseIdentifier:@"PSAppointmentInstructionCell"];
    [self.appointmentTableView registerClass:[PSLastCallInfoCell class] forCellReuseIdentifier:@"PSLastCallInfoCell"];
    [self.view addSubview:self.appointmentTableView];
    [self.appointmentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(applyButton.mas_top).offset(-20);
        make.top.mas_equalTo(self.calendar.mas_bottom).offset(5);
    }];
}

- (void)requestPhoneCard {
    PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
    [[PSLoadingView sharedInstance] show];
    @weakify(self)
    [appointmentViewModel requestPhoneCardCompleted:^(PSResponse *response) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        [self renderContents];
        [self refreshData:YES];
    } failed:^(NSError *error) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        [self renderContents];
        [self refreshData:YES];
    }];
}



-(void)requsetPhoneCardBalance{
     AccountsViewModel*accountsViewModel=[[AccountsViewModel alloc]init];
    [accountsViewModel requestAccountsCompleted:^(PSResponse *response) {
        self.Balance=[accountsViewModel.blance floatValue];

        [self addPrisonerFamliesAction];

    } failed:^(NSError *error) {
        if (error.code>=500) {
            [self showInternetError];
        }else{
            [self showNetError];
        }
    }];
}

- (BOOL)judgeNowDate:(NSDate *)nowDate selectedDate:(NSDate *)seletedDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *nowDateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:nowDate];
    nowDateComponents.hour = 0;
    nowDateComponents.second = 0;
    NSDate *newNowDate = [calendar dateFromComponents:nowDateComponents];
    NSDateComponents *selectedDateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:seletedDate];
    selectedDateComponents.hour = 0;
    selectedDateComponents.second = 0;
    NSDate *newSelectedDate = [calendar dateFromComponents:selectedDateComponents];
    NSTimeInterval timeInterval = [newSelectedDate timeIntervalSinceDate:newNowDate];
    NSInteger days = ceil(timeInterval / (24*60*60));
    
    if (days > 60) {
        return NO;
    } else {
        return YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestPhoneCard];
    self.selectArray=[NSArray array];
    self.meetingMembersArray=[[NSMutableArray alloc ]init];

    
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row == 1 ? 109 : 49;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PSLastCallInfoCell"];
            PSInstructionsDataView*instructionsDataView=[[PSInstructionsDataView alloc]init];
            [cell addSubview:instructionsDataView];

            PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
            PSMeeting *latestFinishedMeeting = [appointmentViewModel latestFinishedMeetingOfDate:self.calendar.currentPage];
            NSString*Last_call_time=NSLocalizedString(@"Last_call_time", @"上次通话时间：暂无通话");
            cell.textLabel.text = latestFinishedMeeting ? [NSString stringWithFormat:@"上次通话时间：%@",latestFinishedMeeting.meetingTime] : Last_call_time;
           
            
        }
            break;
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PSAppointmentDetailCell"];
            PSAppointmentDetailCell *detailCell = (PSAppointmentDetailCell *)cell;
            @weakify(self)
            NSArray *langArr = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
            NSString*language = langArr.firstObject;
            if ([language isEqualToString:@"vi-US"]||[language isEqualToString:@"vi-VN"]||[language isEqualToString:@"vi-CN"]) {
               detailCell.buyButton.hidden=YES;
            }
            else{
            [detailCell.buyButton bk_whenTapped:^{
                @strongify(self)
                detailCell.buyButton.hidden=NO;
                [self buyCardAction];
            }];
            }
            AccountsViewModel*accountsModel=[[AccountsViewModel alloc]init];
            [accountsModel requestAccountsCompleted:^(PSResponse *response) {
                detailCell.balanceLabel.text = [NSString stringWithFormat:@"¥%.2f",[accountsModel.blance floatValue]];
            } failed:^(NSError *error) {
                [PSTipsView showTips:@"获取余额失败"];
            }];


            PSAppointmentViewModel *appointmentViewModel = (PSAppointmentViewModel *)self.viewModel;
            NSInteger times = [appointmentViewModel passedMeetingTimesOfDate:self.calendar.currentPage];
            NSMutableAttributedString *timesString = [NSMutableAttributedString new];
            [timesString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld",(long)times] attributes:@{NSFontAttributeName:FontOfSize(14),NSForegroundColorAttributeName:UIColorFromHexadecimalRGB(0x333333)}]];
            NSString*one=NSLocalizedString(@"one", @"次");
            [timesString appendAttributedString:[[NSAttributedString alloc] initWithString:one attributes:@{NSFontAttributeName:FontOfSize(10),NSForegroundColorAttributeName:AppBaseTextColor2}]];
            detailCell.timesLabel.attributedText = timesString;
        }
            break;
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PSAppointmentInstructionCell"];
            @weakify(self)
            [((PSAppointmentInstructionCell *)cell).helpButton bk_whenTapped:^{
                @strongify(self)
                [self helpAction];
            }];
        }
            break;
        default:
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
        }
            break;
    }
    return cell;
}

#pragma mark - FSCalendarDataSource
/*
- (nullable NSString *)calendar:(FSCalendar *)calendar titleForDate:(NSDate *)date {
    PSAppointmentViewModel *appointment = (PSAppointmentViewModel *)self.viewModel;
    PSMeeting *meeting = [appointment meetingOfDate:date];
    
    NSString *title = nil;
    if ([meeting.status isEqualToString:@"FINISHED"]) {
        title = @"完";
    }else if ([meeting.status isEqualToString:@"PENDING"]) {
        title = @"审";
    }else if ([meeting.status isEqualToString:@"CANCELED"]) {
        title = @"取";
    }else if ([meeting.status isEqualToString:@"DENIED"]) {
        title = @"拒";
    }else if ([meeting.status isEqualToString:@"PASSED"]) {
        title = @"待";
        
    }
    else if ([meeting.status isEqualToString:@"EXPIRED"]) {
        title = @"过";
        
    }else if (![calendar.today isEqualToDate:calendar.selectedDate] && [calendar.today isEqualToDate:date]) {
        title = @"今";
    }
    return title;
}
*/
- (nullable NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date {
    PSAppointmentViewModel *appointment = (PSAppointmentViewModel *)self.viewModel;
    PSMeeting *meeting = [appointment meetingOfDate:date];
    NSString *subtitle = nil;
    if ([meeting.status isEqualToString:@"PASSED"]) {
        subtitle = meeting.meetingPeriod;
    }
    return subtitle;
}

#pragma mark - FSCalendarDelegate
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition {
    if (![[self.calendar.currentPage yearMonth] isEqualToString:[date yearMonth]]) {
        [self.calendar selectDate:date scrollToDate:YES];
    }
    [self.dateView setNowDate:self.calendar.today selectedDate:self.calendar.selectedDate];
    [self.calendar reloadData];
}




- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated {
    
}



- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar {
    if (![self.calendar.selectedDate.yearMonth isEqualToString:self.calendar.currentPage.yearMonth]) {
        if ([self.calendar.currentPage.yearMonth isEqualToString:self.calendar.today.yearMonth]) {
            if (![self.calendar.selectedDate.yearMonthDay isEqualToString:self.calendar.today.yearMonthDay]) {
                NSDate *todayNext = [self.calendar.today dateByAddingTimeInterval:24 * 60 * 60];
                [self.calendar selectDate:todayNext];
            }
        }else{
            [self.calendar selectDate:self.calendar.currentPage];
        }
    }
    [self.dateView setNowDate:self.calendar.today selectedDate:self.calendar.selectedDate];
    [self refreshData:NO];
}

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition {
    BOOL shouldSelect = NO;
    if (([date compare:self.calendar.today] == NSOrderedDescending)&&[self judgeNowDate:self.calendar.today selectedDate:date]) {
        shouldSelect = YES;

    }
    return shouldSelect;
}

#pragma mark - FSCalendarDelegateAppearance
- (CGPoint)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleOffsetForDate:(NSDate *)date {
    PSAppointmentViewModel *appointment = (PSAppointmentViewModel *)self.viewModel;
    PSMeeting *meeting = [appointment meetingOfDate:date];
    CGPoint offset = CGPointZero;
    if ([meeting.status isEqualToString:@"PASSED"]) {
        offset = CGPointMake(0, 5);
    }
    return offset;
}




- (CGPoint)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance subtitleOffsetForDate:(NSDate *)date {
    PSAppointmentViewModel *appointment = (PSAppointmentViewModel *)self.viewModel;
    PSMeeting *meeting = [appointment meetingOfDate:date];
    CGPoint offset = CGPointZero;
    if ([meeting.status isEqualToString:@"PASSED"]) {
        offset = CGPointMake(0, 12);
    }
    return offset;
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillDefaultColorForDate:(NSDate *)date {
    PSAppointmentViewModel *appointment = (PSAppointmentViewModel *)self.viewModel;
    PSMeeting *meeting = [appointment meetingOfDate:date];
    UIColor *color = nil;
    if ([meeting.status isEqualToString:@"EXPIRED"]) {
        color = AppBaseTextColor1;
    }else if ([meeting.status isEqualToString:@"FINISHED"]){
        color = UIColorFromRGB(83, 119, 185);
    }else if ([meeting.status isEqualToString:@"PENDING"]) {
        color = UIColorFromHexadecimalRGB(0xff8a07);
    }else if ([meeting.status isEqualToString:@"CANCELED"] || [meeting.status isEqualToString:@"DENIED"]) {
        color = [UIColor redColor];
    }else if ([meeting.status isEqualToString:@"PASSED"]) {
        //color = [UIColor purpleColor];
        color=UIColorFromRGB(0, 142, 60);
    }
    return color;
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillSelectionColorForDate:(NSDate *)date {
    PSAppointmentViewModel *appointment = (PSAppointmentViewModel *)self.viewModel;
    PSMeeting *meeting = [appointment meetingOfDate:date];
    UIColor *color = nil;
    if ([meeting.status isEqualToString:@"FINISHED"]) {
        color = AppBaseTextColor1;
    }else if ([meeting.status isEqualToString:@"PENDING"]) {
        color = UIColorFromHexadecimalRGB(0xff8a07);
    }else if ([meeting.status isEqualToString:@"CANCELED"] || [meeting.status isEqualToString:@"DENIED"]) {
        color = [UIColor redColor];
    }else if ([meeting.status isEqualToString:@"PASSED"]) {
        //color = [UIColor purpleColor];
        color=UIColorFromRGB(0, 142, 60);
    }
    return color;
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleDefaultColorForDate:(NSDate *)date {
    UIColor *defaultColor =UIColorFromHexadecimalRGB(0x333333);
    PSAppointmentViewModel *appointment = (PSAppointmentViewModel *)self.viewModel;
    PSMeeting *meeting = [appointment meetingOfDate:date];
    if (meeting || [date isEqualToDate:calendar.today]) {
        defaultColor = [UIColor whiteColor];
    }
    else if (!([date compare:self.calendar.today] == NSOrderedDescending)){
        defaultColor = AppBaseTextColor2;
    }
    else if (![self judgeNowDate:self.calendar.today selectedDate:date]){
        defaultColor = AppBaseTextColor2;
    }
    return defaultColor;
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleSelectionColorForDate:(NSDate *)date {
    return [UIColor whiteColor];
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance subtitleDefaultColorForDate:(NSDate *)date {
    
   
    return AppBaseTextColor1;
    
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance subtitleSelectionColorForDate:(NSDate *)date {
    return AppBaseTextColor1;
}

#pragma mark - PSIMMessageObserver
- (void)receivedMeetingMessage:(PSMeetingMessage *)message {
    switch (message.code) {
        case PSMeetingStart:
        {
            
        }
            break;
        case PSMeetingEnter:
        {
            //进入会议
            [self handleMeetingStatusMessage:message];
        }
            break;
        case PSMeetingEnd:
        {
            
        }
            break;
        case PSMeetingStatus:
        {
            [self handleMeetingStatusMessage:message];
        }
            break;
        default:
            break;
    }
}

#pragma mark - PSSessionObserver
- (void)userBalanceDidSynchronized {
    [self.appointmentTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
