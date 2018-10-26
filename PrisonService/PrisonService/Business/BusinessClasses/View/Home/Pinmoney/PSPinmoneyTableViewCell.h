//
//  PSPinmoneyTableViewCell.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPinmoneyTableViewCell : UITableViewCell
@property (nonatomic, strong, readonly) UILabel *incomeLabel;//收入
@property (nonatomic, strong, readonly) UILabel *dateLabel;
@property (nonatomic, strong, readonly) UILabel *expenditureLabel;//支出
@property (nonatomic, strong, readonly) UILabel *balanceLabel;//余额
@end
