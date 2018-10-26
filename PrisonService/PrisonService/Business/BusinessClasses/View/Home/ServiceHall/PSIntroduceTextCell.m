//
//  PSIntroduceTextCell.m
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSIntroduceTextCell.h"

@implementation PSIntroduceTextCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    _textLabel = [UILabel new];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.font = FontOfSize(10);
    _textLabel.textColor = AppBaseTextColor2;
    _textLabel.numberOfLines = 0;
    [self addSubview:_textLabel];
    CGFloat horSidePadding = 40;
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
        make.left.mas_equalTo(horSidePadding);
        make.right.mas_equalTo(-horSidePadding);
    }];
}

@end
