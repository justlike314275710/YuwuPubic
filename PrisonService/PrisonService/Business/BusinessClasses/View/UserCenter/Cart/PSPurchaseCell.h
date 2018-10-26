//
//  PSPurchaseCell.h
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPurchaseCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *orderNOLabel;
@property (nonatomic, strong, readonly) UILabel *paymentLabel;
@property (nonatomic, strong, readonly) UIButton *buyButton;
@property (nonatomic, strong, readonly) UILabel *priceLabel;
@property (nonatomic, strong, readonly) UILabel *quantityLabel;
@property (nonatomic, strong, readonly) UILabel *infoLabel;
@property (nonatomic, strong, readonly) UILabel *timeLabel;

@end
