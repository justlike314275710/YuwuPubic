//
//  PSPeriodChangeCell.h
//  PrisonService
//
//  Created by calvin on 2018/4/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPeriodChangeCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *startDateLabel;
@property (nonatomic, strong, readonly) UILabel *rangeLabel;
@property (nonatomic, strong, readonly) UILabel *typeLabel;
@property (nonatomic, strong, readonly) UILabel *endDateLabel;

@end
