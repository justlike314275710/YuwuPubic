//
//  PSBuyCardStepCell.h
//  PrisonService
//
//  Created by calvin on 2018/4/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSBuyCardStepCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *moneyLabel;
@property (nonatomic, strong, readonly) UIButton *reduceButton;
@property (nonatomic, strong, readonly) UIButton *increaseButton;
@property (nonatomic, strong, readonly) UILabel *quantityLabel;

@end
