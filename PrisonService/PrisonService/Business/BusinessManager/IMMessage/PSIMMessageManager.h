//
//  PSNIMManager.h
//  PrisonService
//
//  Created by calvin on 2018/4/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSMeetingMessage.h"
#import "PSLaunchTask.h"

@protocol PSIMMessageObserver <NSObject>

@optional
- (void)receivedMeetingMessage:(PSMeetingMessage *)message;
- (void)receivedLocalMeetingMessage:(PSMeetingMessage *)message;

@end

@interface PSIMMessageManager : NSObject<PSLaunchTask>

+ (PSIMMessageManager *)sharedInstance;
- (void)addObserver:(id<PSIMMessageObserver>)observer;
- (void)removeObserver:(id<PSIMMessageObserver>)observer;
- (void)sendMeetingMessage:(PSMeetingMessage *)message;
- (void)logoutIM;

@end
