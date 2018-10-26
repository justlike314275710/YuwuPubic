//
//  PSCommentHeaderView.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCommentHeaderView.h"

@implementation PSCommentHeaderView
- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    CGFloat horSideSpace = 15;
    CGFloat verSideSpace = 15;
    _titleLabel = [UILabel new];
    _titleLabel.font = AppBaseTextFont1;
    _titleLabel.textColor = AppBaseTextColor1;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSideSpace);
        make.top.mas_equalTo(verSideSpace);
        make.right.mas_equalTo(-horSideSpace);
        make.height.mas_equalTo(16);
    }];
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = AppBaseTextFont2;
    _contentLabel.textColor = AppBaseTextColor1;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSideSpace);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(-horSideSpace);
        make.bottom.mas_equalTo(-verSideSpace);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
