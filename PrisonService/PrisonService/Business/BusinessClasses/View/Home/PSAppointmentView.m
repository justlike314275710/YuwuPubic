//
//  PSAppointmentView.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAppointmentView.h"
#import "PSAppointmentCell.h"

@interface PSAppointmentView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *appointmentTableView;
@property (nonatomic, strong) UILabel *appointmentLabel;

@end

@implementation PSAppointmentView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self renderContents];
    }
    return self;
}

- (NSAttributedString *)stringWithLeftTime:(NSTimeInterval)interval {
    NSInteger days = interval / 24 / 60 / 60;
    NSInteger hour = interval / 60 / 60;
    NSInteger minute = interval / 60;
    NSInteger amount = days > 0 ? days : (hour > 0 ? hour : minute);

    NSString*day=NSLocalizedString(@"day", @"天");
    NSString*onehour=NSLocalizedString(@"hour", @"小时");
    NSString*min=NSLocalizedString(@"min", @"分钟");
    NSString *unit = days > 0 ? day : (hour > 0 ? onehour : min);
    NSMutableAttributedString *daysString = [NSMutableAttributedString new];
    [daysString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld",(long)amount] attributes:@{NSFontAttributeName:FontOfSize(60),NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    [daysString appendAttributedString:[[NSAttributedString alloc] initWithString:unit attributes:@{NSFontAttributeName:FontOfSize(10),NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    return daysString;
}

- (void)renderContents {
    CGFloat horSidePadding = 15;
    UIView *bottomView = [UIView new];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(160);
    }];
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.image = [UIImage imageNamed:@"homeAppointmentBg"];
    [bottomView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    UIView *appointmentListView = [UIView new];
    [bottomView addSubview:appointmentListView];
    [appointmentListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    UILabel *appointmentListLabel = [UILabel new];
    appointmentListLabel.font = AppBaseTextFont2;
    appointmentListLabel.textColor = [UIColor whiteColor];
    appointmentListLabel.textAlignment = NSTextAlignmentLeft;
    NSString*Recentappointment=NSLocalizedString(@"Recent appointment", @"近期预约");
    appointmentListLabel.text = Recentappointment;
    [appointmentListView addSubview:appointmentListLabel];
    [appointmentListLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(27);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(13);
    }];
    UIView *seperateLine = [UIView new];
    seperateLine.backgroundColor = UIColorFromHexadecimalRGB(0xffd29c);
    [appointmentListView addSubview:seperateLine];
    [seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(appointmentListLabel.mas_bottom).offset(7);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    self.appointmentTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.appointmentTableView.backgroundColor = [UIColor clearColor];;
    self.appointmentTableView.dataSource = self;
    self.appointmentTableView.delegate = self;
    self.appointmentTableView.separatorInset = UIEdgeInsetsZero;
    self.appointmentTableView.layoutMargins = UIEdgeInsetsZero;
    self.appointmentTableView.tableFooterView = [UIView new];
    [self.appointmentTableView registerClass:[PSAppointmentCell class] forCellReuseIdentifier:@"PSAppointmentCell"];
    [appointmentListView addSubview:self.appointmentTableView];
    [self.appointmentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(seperateLine.mas_bottom);
    }];
    NSString* Reservation_left=NSLocalizedString(@"Reservation left", @"预约还剩");
    _appointmentLabel = [UILabel new];
    _appointmentLabel.font = AppBaseTextFont1;
    _appointmentLabel.textColor = [UIColor whiteColor];
    _appointmentLabel.textAlignment = NSTextAlignmentLeft;
    _appointmentLabel.text = Reservation_left;
    [bottomView addSubview:_appointmentLabel];
    [_appointmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSidePadding);
        make.top.mas_equalTo(40);
        make.right.mas_equalTo(appointmentListView.mas_left).offset(20);
        make.height.mas_equalTo(17);
    }];
    _appointmentDayLeftLabel = [UILabel new];
    _appointmentDayLeftLabel.font = AppBaseTextFont1;
    _appointmentDayLeftLabel.textColor = [UIColor whiteColor];
    _appointmentDayLeftLabel.textAlignment = NSTextAlignmentLeft;
    [bottomView addSubview:_appointmentDayLeftLabel];
    [_appointmentDayLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSidePadding);
        make.top.mas_equalTo(_appointmentLabel.mas_bottom).offset(15);
        make.right.mas_equalTo(_appointmentLabel.mas_right);
        make.height.mas_equalTo(60);
    }];
}

- (void)reloadData {
    [self.appointmentTableView setContentOffset:CGPointMake(0, 0)];
    [self.appointmentTableView reloadData];
}

- (void)updateTimeLeft:(NSTimeInterval)interval haveMeeting:(BOOL)have {
    if (have) {
        if (interval < 0) {
            NSString*appointmentPassed=NSLocalizedString(@"appointment passed", @"您今天的预约时间已过");
            _appointmentLabel.text = appointmentPassed;
            _appointmentDayLeftLabel.text = nil;
        }else{
            NSString* Reservation_left=NSLocalizedString(@"Reservation left", @"预约还剩");
            _appointmentLabel.text = Reservation_left;
            _appointmentDayLeftLabel.attributedText = [self stringWithLeftTime:interval];
        }
    }else{
        NSString* Reservation_left=NSLocalizedString(@"Reservation left", @"预约还剩");
        NSString*NoappointmentsYet=NSLocalizedString(@"No appointments yet",  @"您暂没有预约");
        _appointmentLabel.text = Reservation_left;
        _appointmentDayLeftLabel.text = NoappointmentsYet;
    }
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger row = 0;
    if (self.listRows) {
        row = self.listRows();
    }
    return row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PSAppointmentCell"];
    NSString *content = nil;
    if (self.listRowText) {
        content = self.listRowText(indexPath.row);
    }
    cell.contentLabel.text = content;
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
