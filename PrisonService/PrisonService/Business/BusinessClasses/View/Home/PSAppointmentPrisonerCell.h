//
//  PSAppointmentPrisonerCell.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger(^NumberOfPrisoners)();
typedef NSString *(^NameOfPrisonerAtIndex)(NSInteger index);
typedef void(^AppointPrisonerAtIndex)(NSInteger index);
typedef void(^DidScrollToIndex)(NSInteger index);
typedef void(^BindPrisoner)();

@interface PSAppointmentPrisonerCell : UICollectionViewCell

@property (nonatomic, copy) NumberOfPrisoners numberOfPrisoner;
@property (nonatomic, copy) NameOfPrisonerAtIndex nameOfPrisoner;
@property (nonatomic, copy) AppointPrisonerAtIndex appointIndex;
@property (nonatomic, copy) DidScrollToIndex scrollToIndex;
@property (nonatomic, copy) BindPrisoner bindAction;

- (void)reloadData;

@end
