//
//  PSHallFunctionCell.h
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PSItemPosition) {
    PSPositionRowRight,
    PSPositionLastRowRight,
    PSPositionLastRowOther,
    PSPositionOther
};

@interface PSHallFunctionCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIImageView *functionImageView;
@property (nonatomic, strong, readonly) UILabel *functionNameLabel;
@property (nonatomic, assign) PSItemPosition itemPosition;

@end
