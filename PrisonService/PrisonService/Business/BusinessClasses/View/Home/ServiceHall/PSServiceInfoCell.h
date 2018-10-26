//
//  PSServiceInfoCell.h
//  PrisonService
//
//  Created by calvin on 2018/4/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSFamilyServiceInfoView.h"

@interface PSServiceInfoCell : UICollectionViewCell

@property (nonatomic, strong, readonly) PSFamilyServiceInfoView *infoView;

@end
