//
//  PSAppointmentPrisonerView.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonerCell.h"

@implementation PSPrisonerCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    UIView *topView = [UIView new];
    topView.backgroundColor = AppBaseBackgroundColor2;
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(135);
    }];
    CGFloat topPadding = 25;
    CGFloat horSidePadding = 15;
    _appointmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _appointmentButton.backgroundColor = AppBaseTextColor3;
    _appointmentButton.titleLabel.font = AppBaseTextFont2;
    [_appointmentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    NSString*reservation=NSLocalizedString(@"apply", @"预约");
    [_appointmentButton setTitle:reservation forState:UIControlStateNormal];
    [topView addSubview:_appointmentButton];
    [_appointmentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topPadding);
        make.right.mas_equalTo(-horSidePadding);
        make.size.mas_equalTo(CGSizeMake(76, 35));
    }];
    UIView *line = [UIView new];
    line.backgroundColor = UIColorFromHexadecimalRGB(0xeaebee);
    [topView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_appointmentButton.mas_left).offset(-10);
        make.top.mas_equalTo(_appointmentButton.mas_top);
        make.bottom.mas_equalTo(-40);
        make.width.mas_equalTo(1);
    }];
    _prisonerLabel = [UILabel new];
    _prisonerLabel.font = AppBaseTextFont1;
    _prisonerLabel.textColor = UIColorFromHexadecimalRGB(0x333333);
    _prisonerLabel.textAlignment = NSTextAlignmentLeft;
    [topView addSubview:_prisonerLabel];
    [_prisonerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSidePadding);
        make.right.mas_equalTo(line.mas_left).offset(-10);
        make.top.mas_equalTo(_appointmentButton.mas_top);
        make.height.mas_equalTo(20);
    }];
    _operationView = [UIView new];
    [topView addSubview:_operationView];
    [_operationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_prisonerLabel.mas_bottom).offset(24);
        make.left.mas_equalTo(_prisonerLabel.mas_left);
        make.right.mas_equalTo(80);
        make.height.mas_equalTo(29);
    }];
    _operationImageView = [UIImageView new];
    _operationImageView.contentMode = UIViewContentModeCenter;
    _operationImageView.image = [UIImage imageNamed:@"homeAddBindIcon"];
    [_operationView addSubview:_operationImageView];
    [_operationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.height.mas_equalTo(29);
        make.centerY.mas_equalTo(_operationView);
    }];
    _titlLabel = [UILabel new];
    _titlLabel.font = FontOfSize(11);
    _titlLabel.textColor = UIColorFromHexadecimalRGB(0x888888);
    _titlLabel.textAlignment = NSTextAlignmentLeft;
    NSString*prison_manager=NSLocalizedString(@"prison_manager", nil);
    _titlLabel.text = prison_manager;
    [_operationView addSubview:_titlLabel];
    [_titlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_operationImageView.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(_operationView.mas_centerY).offset(-3);
        make.height.mas_equalTo(12);
    }];
    _tipsLabel = [UILabel new];
    _tipsLabel.font = FontOfSize(9);
    _tipsLabel.textColor = AppBaseTextColor2;
    _tipsLabel.textAlignment = NSTextAlignmentLeft;
    
    NSString*Clicktoview=NSLocalizedString(@"Click to view", @"点击查看");
    _tipsLabel.text = Clicktoview;
    [_operationView addSubview:_tipsLabel];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_operationImageView.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(_operationView.mas_centerY).offset(3);
        make.height.mas_equalTo(11);
    }];
    UIImageView *seperaterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeSeperateIcon"]];
    [topView addSubview:seperaterImageView];
    [seperaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(-15);
        make.size.mas_equalTo(seperaterImageView.frame.size);
    }];
}

@end
