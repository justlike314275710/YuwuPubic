//
//  PSServiceInfoCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSServiceInfoCell.h"

@implementation PSServiceInfoCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView *bgImageView = [UIImageView new];
        bgImageView.image = [[UIImage imageNamed:@"serviceHallServiceBg"] stretchImage];
        [self addSubview:bgImageView];
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(36);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.bottom.mas_equalTo(0);
        }];
        _infoView = [PSFamilyServiceInfoView new];
        [self addSubview:_infoView];
        [_infoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(bgImageView.mas_left);
            make.right.mas_equalTo(bgImageView.mas_right);
            make.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

@end
