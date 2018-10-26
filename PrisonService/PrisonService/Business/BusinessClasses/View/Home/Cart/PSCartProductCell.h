//
//  PSCartProductCell.h
//  PrisonService
//
//  Created by calvin on 2018/5/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSCartProductCell : UITableViewCell

@property (nonatomic, strong, readonly) UIImageView *productImageView;
@property (nonatomic, strong, readonly) UILabel *productNameLabel;
@property (nonatomic, strong, readonly) UILabel *priceLabel;
@property (nonatomic, strong, readonly) UILabel *quantityLabel;
@property (nonatomic, strong, readonly) UIButton *selectStatusView;
@property (nonatomic, strong, readonly) UIButton *reduceButton;
@property (nonatomic, strong, readonly) UIButton *increaseButton;

@end
