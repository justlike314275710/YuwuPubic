//
//  PSServiceCentreViewController.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/10/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSServiceCentreViewController.h"
#import "PSServiceCentreTableViewCell.h"
#import "PSLegalServiceTableViewCell.h"
#import "PSPsychologicalCounselingTableViewCell.h"
#import "PSSessionNoneViewController.h"
#import "PSSessionManager.h"
#import "PSHomeViewModel.h"
#import "PSLocalMeetingViewController.h"
#import "PSAppointmentViewController.h"
#import "PSAppointmentViewModel.h"
#import "PSWorkViewModel.h"
#import "PSComplaintSuggestionViewController.h"
#import "PSLoginViewModel.h"
#import <AFNetworking/AFNetworking.h>
#import "PSMoreServiceViewController.h"
#import "PSMoreServiceViewModel.h"
@interface PSServiceCentreViewController ()

@end

@implementation PSServiceCentreViewController


#pragma mark  - life cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reachability];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self renderContents];
   
    // Do any additional setup after loading the view.
}
#pragma mark  - notification

#pragma mark  - action

- (void)choseTerm:(NSInteger)tag{
    switch ([PSSessionManager sharedInstance].loginStatus) {
        case PSLoginPassed:
            if (tag==0) {
                [self appointmentPrisoner];
            }
            else if (tag==1){
            [self requestLocalMeeting];
            }
            else if (tag==2){
                NSString*coming_soon=
                NSLocalizedString(@"coming_soon", @"敬请期待");
                [PSTipsView showTips:coming_soon];
            }
            else if (tag==3){
                PSWorkViewModel *viewModel = [PSWorkViewModel new];
                viewModel.newsType = PSNewsPublicShow;
                PSComplaintSuggestionViewController *compaintSuggestionViewController = [[PSComplaintSuggestionViewController alloc] initWithViewModel:viewModel];
                [self.navigationController pushViewController:compaintSuggestionViewController animated:YES];
            }
            break;
            
        default:
            if ([[LXFileManager readUserDataForKey:@"isVistor"]isEqualToString:@"YES"]) {
                [[PSSessionManager sharedInstance]doLogout];
            } else {
                self.hidesBottomBarWhenPushed=YES;
                PSLoginViewModel*viewModel=[[PSLoginViewModel alloc]init];
                [self.navigationController pushViewController:[[PSSessionNoneViewController alloc]initWithViewModel:viewModel] animated:YES];
                self.hidesBottomBarWhenPushed=NO;
            }
            
            
            break;
    }
    
   
}


- (void)appointmentPrisoner {
 
    PSAppointmentViewController *appointmentViewController = [[PSAppointmentViewController alloc] initWithViewModel:[PSAppointmentViewModel new]];
    [self.navigationController pushViewController:appointmentViewController animated:YES];
}

- (void)requestLocalMeeting {
    PSHomeViewModel *homeViewModel = (PSHomeViewModel *)self.viewModel;
    @weakify(self)
    [homeViewModel requestLocalMeetingDetailCompleted:^(PSResponse *response) {
        @strongify(self)
        if (response.code==-100) {
            [PSTipsView showTips:@"该监狱未开通网上预约功能"];
        }
        else{
            PSLocalMeetingViewController *meetingViewController = [[PSLocalMeetingViewController alloc] initWithViewModel:[PSLocalMeetingViewModel new]];
            [self.navigationController pushViewController:meetingViewController animated:YES];
        }
    } failed:^(NSError *error) {
        [self showNetError];
    }];
}

#pragma mark  - UITableViewDelegate OR otherDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height=0;
    switch (indexPath.row){
        case 0:{ height=114;} break;
        case 1:{ height=162;} break;
        case 2:{ height=90; } break;
        default:{}break;
    }

    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        PSServiceCentreTableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:@"PSServiceCentreTableViewCell"];
        cell.delegate=self;
        return cell;
    }
    else if (indexPath.row==1){
         PSLegalServiceTableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:@"PSLegalServiceTableViewCell"];

        [cell.moreButton bk_whenTapped:^{
            NSString*coming_soon=
            NSLocalizedString(@"coming_soon", @"敬请期待");
            [PSTipsView showTips:coming_soon];
//             [self p_insertMoreServiceVC];
        }];
        [cell.FinanceButton bk_whenTapped:^{
             NSString*coming_soon=
            NSLocalizedString(@"coming_soon", @"敬请期待");
            [PSTipsView showTips:coming_soon];
        }];
        [cell.MarriageButton bk_whenTapped:^{
             NSString*coming_soon=
            NSLocalizedString(@"coming_soon", @"敬请期待");
            [PSTipsView showTips:coming_soon];
        }];
        
        return cell;
    }

    else{
        PSPsychologicalCounselingTableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:@"PSPsychologicalCounselingTableViewCell"];
        [cell.goButton bk_whenTapped:^{
             NSString*coming_soon=
            NSLocalizedString(@"coming_soon", @"敬请期待");
            [PSTipsView showTips:coming_soon];
        }];
        return cell;
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

- (void)p_insertMoreServiceVC {
    PSMoreServiceViewController *PSMoreServiceVC = [[PSMoreServiceViewController alloc] initWithViewModel:[PSMoreServiceViewModel new]];
    [self.navigationController pushViewController:PSMoreServiceVC animated:YES];
}

- (BOOL)hiddenNavigationBar{
    return YES;
}

- (BOOL)showAdv {
    return YES;
}

#pragma mark  - UI

- (void)renderContents{
    self.view.backgroundColor=UIColorFromRGBA(248, 247, 254, 1);
    self.serviceCentreTableView.backgroundColor = [UIColor whiteColor];
    _serviceCentreTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.serviceCentreTableView.dataSource = self;
    self.serviceCentreTableView.delegate = self;
    self.serviceCentreTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.serviceCentreTableView.showsVerticalScrollIndicator=NO;
    self.serviceCentreTableView.backgroundColor = [UIColor clearColor];
    [self.serviceCentreTableView registerClass:[PSServiceCentreTableViewCell class] forCellReuseIdentifier:@"PSServiceCentreTableViewCell"];
    [self.serviceCentreTableView registerClass:[PSLegalServiceTableViewCell class] forCellReuseIdentifier:@"PSLegalServiceTableViewCell"];
    [self.serviceCentreTableView registerClass:[PSPsychologicalCounselingTableViewCell class] forCellReuseIdentifier:@"PSPsychologicalCounselingTableViewCell"];
    self.serviceCentreTableView.tableFooterView = [UIView new];
//    if (@available(iOS 11.0, *)) {
//        self.serviceCentreTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    [self.view addSubview:self.serviceCentreTableView];
    [self.serviceCentreTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-64);
        //make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    _advView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.55467) imageURLStringsGroup:nil];
    NSString*serviceHallAdvDefault=@"服务中心广告图";
    _advView.placeholderImage = [UIImage imageNamed:serviceHallAdvDefault];
    _advView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    self.serviceCentreTableView.tableHeaderView = _advView;
}
#pragma mark  - setter & getter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)reachability {
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [KGStatusBar dismiss];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                //[self showInternetError];
                [KGStatusBar showWithStatus:@"当前网络不可用,请检查你的网络设置"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [KGStatusBar dismiss];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [KGStatusBar dismiss];
            break; } }];
    [mgr startMonitoring];
    
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
