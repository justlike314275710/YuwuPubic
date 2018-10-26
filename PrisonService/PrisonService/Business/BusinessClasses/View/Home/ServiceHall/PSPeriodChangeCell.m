//
//  PSPeriodChangeCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPeriodChangeCell.h"
#import "PSDashiLine.h"
#import "NSArray+MASAdditions.h"

@implementation PSPeriodChangeCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.image = [[UIImage imageNamed:@"serviceHallServiceBg"] stretchImage];
    [self addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    CGFloat sidePadding = 15;
    CGFloat verticalPadding = 10;
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor clearColor];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bgImageView.mas_top);
        make.left.mas_equalTo(bgImageView.mas_left);
        make.right.mas_equalTo(bgImageView.mas_right);
        make.bottom.mas_equalTo(bgImageView.mas_bottom);
    }];
    PSDashiLine *dashLine = [PSDashiLine new];
    [contentView addSubview:dashLine];
    [dashLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sidePadding);
        make.right.mas_equalTo(-sidePadding);
        make.centerY.mas_equalTo(contentView);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *changeLabel = [UILabel new];
    changeLabel.font = AppBaseTextFont2;
    changeLabel.textAlignment = NSTextAlignmentCenter;
    changeLabel.textColor = AppBaseTextColor1;
    changeLabel.text = @"变动时间";
    [contentView addSubview:changeLabel];
    [changeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sidePadding);
        make.right.mas_equalTo(-sidePadding);
        make.bottom.mas_equalTo(dashLine.mas_top).offset(-verticalPadding);
        make.height.mas_equalTo(14);
    }];
    _startDateLabel = [UILabel new];
    _startDateLabel.font = AppBaseTextFont1;
    _startDateLabel.textAlignment = NSTextAlignmentCenter;
    _startDateLabel.textColor = AppBaseTextColor3;
    [contentView addSubview:_startDateLabel];
    [_startDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sidePadding);
        make.right.mas_equalTo(-sidePadding);
        make.bottom.mas_equalTo(changeLabel.mas_top).offset(-verticalPadding);
        make.height.mas_equalTo(16);
    }];
    _rangeLabel = [UILabel new];
    _rangeLabel.font = AppBaseTextFont1;
    _rangeLabel.textAlignment = NSTextAlignmentCenter;
    _rangeLabel.textColor = AppBaseTextColor1;
    [contentView addSubview:_rangeLabel];
    [_rangeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dashLine.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(16);
    }];
    _typeLabel = [UILabel new];
    _typeLabel.font = AppBaseTextFont1;
    _typeLabel.textAlignment = NSTextAlignmentCenter;
    _typeLabel.textColor = AppBaseTextColor1;
    [contentView addSubview:_typeLabel];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dashLine.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(16);
    }];
    _endDateLabel = [UILabel new];
    _endDateLabel.font = AppBaseTextFont1;
    _endDateLabel.textAlignment = NSTextAlignmentCenter;
    _endDateLabel.textColor = AppBaseTextColor1;
    [contentView addSubview:_endDateLabel];
    [_endDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dashLine.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(16);
    }];
    [@[_rangeLabel,_typeLabel,_endDateLabel] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:sidePadding tailSpacing:sidePadding];
    
    UILabel *rangeTextLabel = [UILabel new];
    rangeTextLabel.font = AppBaseTextFont2;
    rangeTextLabel.textAlignment = NSTextAlignmentCenter;
    rangeTextLabel.textColor = AppBaseTextColor2;
    rangeTextLabel.text = @"变动幅度";
    [contentView addSubview:rangeTextLabel];
    [rangeTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_rangeLabel.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(14);
    }];
    UILabel *typeLabel = [UILabel new];
    typeLabel.font = AppBaseTextFont2;
    typeLabel.textAlignment = NSTextAlignmentCenter;
    typeLabel.textColor = AppBaseTextColor2;
    typeLabel.text = @"变动类型";
    [contentView addSubview:typeLabel];
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_typeLabel.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(14);
    }];
    UILabel *endDateLabel = [UILabel new];
    endDateLabel.font = AppBaseTextFont2;
    endDateLabel.textAlignment = NSTextAlignmentCenter;
    endDateLabel.textColor = AppBaseTextColor2;
    endDateLabel.text = @"变动后止日";
    [contentView addSubview:endDateLabel];
    [endDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_endDateLabel.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(14);
    }];
    [@[rangeTextLabel,typeLabel,endDateLabel] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:sidePadding tailSpacing:sidePadding];
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
