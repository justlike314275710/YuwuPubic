//
//  PSAppointmentView.h
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger(^AppointListRows)();
typedef NSString *(^AppointListTextOfRow)(NSInteger index);

@interface PSAppointmentView : UIView

@property (nonatomic, strong, readonly) UILabel *appointmentDayLeftLabel;
@property (nonatomic, copy) AppointListRows listRows;
@property (nonatomic, copy) AppointListTextOfRow listRowText;

- (void)updateTimeLeft:(NSTimeInterval)interval haveMeeting:(BOOL)have;
- (void)reloadData;

@end
