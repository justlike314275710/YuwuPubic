//
//  PSBalanceTopView.h
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSBalanceTopView : UIView

@property (nonatomic, strong, readonly) UILabel *balanceLabel;
@property (nonatomic, strong, readonly) UIButton *refundButton;
@property (nonatomic, assign, readonly) CGFloat topRate;
@property (nonatomic, assign, readonly) CGFloat infoRate;

@end
