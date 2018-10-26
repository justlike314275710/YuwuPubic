//
//  PSAppointmentInstructionCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAppointmentInstructionCell.h"

@implementation PSAppointmentInstructionCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    CGFloat horSpace = 15;
    UIView *headerView = [UIView new];
    headerView.backgroundColor = UIColorFromHexadecimalRGB(0x264c90);
    [self addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSpace);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(14);
    }];
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = FontOfSize(14);
    titleLabel.textColor = UIColorFromHexadecimalRGB(0x3333333);
    NSString*Directions_for_use=NSLocalizedString(@"Directions_for_use",  @"使用说明");
    titleLabel.text = Directions_for_use;
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headerView.mas_right).offset(10);
        make.top.mas_equalTo(headerView.mas_top);
        make.bottom.mas_equalTo(headerView.mas_bottom);
        make.right.mas_equalTo(-horSpace);
    }];
    _helpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_helpButton setImage:[UIImage imageNamed:@"appointmentHelpIcon"] forState:UIControlStateNormal];
    [self addSubview:_helpButton];
    [_helpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
