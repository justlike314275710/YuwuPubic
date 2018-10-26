//
//  PSUserCenterTopView.h
//  PrisonService
//
//  Created by calvin on 2018/4/11.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYPhotoBrowser.h"

@interface PSUserCenterTopView : UIView

@property (nonatomic, strong, readonly) UIImageView *avatarImageView;//为了做图片放大，暂时弃用
@property (nonatomic, strong, readonly) PYPhotosView *avatarView;
@property (nonatomic, strong, readonly) UILabel *nicknameLabel;

@end
