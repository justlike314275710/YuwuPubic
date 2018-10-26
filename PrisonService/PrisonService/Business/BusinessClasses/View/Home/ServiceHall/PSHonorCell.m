//
//  PSHonorCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSHonorCell.h"
#import "PSDashiLine.h"

@implementation PSHonorCell
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
    
    UILabel *dateTextLabel = [UILabel new];
    dateTextLabel.font = AppBaseTextFont2;
    dateTextLabel.textAlignment = NSTextAlignmentCenter;
    dateTextLabel.textColor = AppBaseTextColor1;
    dateTextLabel.text = @"年度";
    [contentView addSubview:dateTextLabel];
    [dateTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sidePadding);
        make.right.mas_equalTo(-sidePadding);
        make.bottom.mas_equalTo(dashLine.mas_top).offset(-verticalPadding);
        make.height.mas_equalTo(14);
    }];
    _dateLabel = [UILabel new];
    _dateLabel.font = AppBaseTextFont1;
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.textColor = AppBaseTextColor3;
    [contentView addSubview:_dateLabel];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sidePadding);
        make.right.mas_equalTo(-sidePadding);
        make.bottom.mas_equalTo(dateTextLabel.mas_top).offset(-verticalPadding);
        make.height.mas_equalTo(16);
    }];
    _honorLabel = [UILabel new];
    _honorLabel.font = AppBaseTextFont1;
    _honorLabel.textAlignment = NSTextAlignmentCenter;
    _honorLabel.textColor = AppBaseTextColor1;
    [contentView addSubview:_honorLabel];
    [_honorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dashLine.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(16);
        make.left.mas_equalTo(sidePadding);
        make.right.mas_equalTo(-sidePadding);
    }];
    UILabel *honorTextLabel = [UILabel new];
    honorTextLabel.font = AppBaseTextFont2;
    honorTextLabel.textAlignment = NSTextAlignmentCenter;
    honorTextLabel.textColor = AppBaseTextColor2;
    honorTextLabel.text = @"荣誉";
    [contentView addSubview:honorTextLabel];
    [honorTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_honorLabel.mas_bottom).offset(verticalPadding);
        make.height.mas_equalTo(14);
        make.left.mas_equalTo(sidePadding);
        make.right.mas_equalTo(-sidePadding);
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
