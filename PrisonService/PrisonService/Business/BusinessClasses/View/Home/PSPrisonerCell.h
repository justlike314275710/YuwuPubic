//
//  PSAppointmentPrisonerView.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPrisonerCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIButton *appointmentButton;
@property (nonatomic, strong, readonly) UILabel *prisonerLabel;
@property (nonatomic, strong, readonly) UIView *operationView;//点击添加绑定或切换人物
@property (nonatomic, strong, readonly) UIImageView *operationImageView;
@property (nonatomic, strong, readonly) UILabel *titlLabel;
@property (nonatomic, strong, readonly) UILabel *tipsLabel;

@end
