//
//  PSHomeHallSectionView.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSHomeHallSectionView.h"

@implementation PSHomeHallSectionView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = AppBaseTextFont1;
        titleLabel.textColor = UIColorFromHexadecimalRGB(0x333333);
        titleLabel.textAlignment = NSTextAlignmentLeft;
        NSString*serviceHall=NSLocalizedString(@"serviceHall",  @"服务大厅");
        titleLabel.text = serviceHall;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.right.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

@end
