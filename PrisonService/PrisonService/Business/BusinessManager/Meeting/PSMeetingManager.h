//
//  PSMeetingManager.h
//  PrisonService
//
//  Created by calvin on 2018/4/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSLaunchTask.h"
#import "PSNavigationController.h"
@interface PSMeetingManager : NSObject<PSLaunchTask>
@property (nonatomic, strong) PSNavigationController *meetingNavigationController;
@property (nonatomic ,strong) NSString *callDuration;
+ (PSMeetingManager *)sharedInstance;
- (void)startMeeting ;
@end
