//
//  PSCancelReasonView.h
//  PrisonService
//
//  Created by calvin on 2018/5/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CancelMeeting)(NSString *reason);
typedef void(^alertClick)(NSInteger index);
@interface PSCancelReasonView : UIView

@property (nonatomic, copy) CancelMeeting didCancel;
@property (nonatomic,copy) alertClick clickIndex;

- (void)show;
- (void)dismissAnimated:(BOOL)animated;

@end
