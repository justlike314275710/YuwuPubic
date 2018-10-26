//
//  PSDynamicWorkCell.h
//  PrisonService
//
//  Created by calvin on 2018/4/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSWorkCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *prisonLabel;
@property (nonatomic, strong, readonly) UILabel *dateLabel;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *detailLabel;

@end
