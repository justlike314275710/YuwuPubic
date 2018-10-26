//
//  PSServiceOtherCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSServiceOtherCell.h"

@implementation PSServiceOtherCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView *bgImageView = [UIImageView new];
        bgImageView.image = [[UIImage imageNamed:@"serviceHallServiceBg"] stretchImage];
        [self addSubview:bgImageView];
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.bottom.mas_equalTo(0);
        }];
        _iconImageView = [UIImageView new];
        _iconImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(40);
            make.width.height.mas_equalTo(16);
            make.centerY.mas_equalTo(self);
        }];
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"serviceHallArrowIcon"]];
        [self addSubview:arrowImageView];
        [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-30);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(arrowImageView.frame.size);
        }];
        _nameLabel = [UILabel new];
        _nameLabel.font = FontOfSize(10);
        _nameLabel.textColor = UIColorFromHexadecimalRGB(0x8095aa);
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconImageView.mas_right).offset(30);
            make.right.mas_equalTo(arrowImageView.mas_left).offset(-20);
            make.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

@end
