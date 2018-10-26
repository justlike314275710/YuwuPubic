//
//  PSUserCenterTopView.m
//  PrisonService
//
//  Created by calvin on 2018/4/11.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUserCenterTopView.h"
#import "UIImageView+CornerRadius.h"

@implementation PSUserCenterTopView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *bgImage = [UIImage imageNamed:@"userCenterTopBg"];
        UIImageView *bgImageView = [UIImageView new];
        bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        bgImageView.image = bgImage;
        [self addSubview:bgImageView];
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(bgImageView.mas_width).multipliedBy(bgImage.size.height/bgImage.size.width);
        }];
        CGFloat radius = 27;
        _avatarView = [PYPhotosView photosView];
        _avatarView.layer.cornerRadius = radius;
        _avatarView.layer.borderWidth = 1.0;
        _avatarView.layer.borderColor = [UIColor whiteColor].CGColor;
        _avatarView.photoWidth = radius * 2;
        _avatarView.photoHeight = radius * 2;
        _avatarView.placeholderImage = [UIImage imageNamed:@"userCenterDefaultAvatar"];
        [self addSubview:_avatarView];
        [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(2 * radius, 2 * radius));
            make.left.mas_equalTo(15);
            make.bottom.mas_equalTo(-50);
        }];
        /*
        _avatarImageView = [[UIImageView alloc] initWithRoundingRectImageView];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_avatarImageView zy_attachBorderWidth:1.0 color:[UIColor whiteColor]];
        [self addSubview:_avatarImageView];
        [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(54, 54));
            make.left.mas_equalTo(15);
            make.bottom.mas_equalTo(-50);
        }];
         */
        _nicknameLabel = [UILabel new];
        _nicknameLabel.textColor = [UIColor whiteColor];
        _nicknameLabel.font = FontOfSize(22);
        [self addSubview:_nicknameLabel];
        [_nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.avatarView.mas_right).offset(8);
            make.centerY.mas_equalTo(self.avatarView.mas_centerY);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
