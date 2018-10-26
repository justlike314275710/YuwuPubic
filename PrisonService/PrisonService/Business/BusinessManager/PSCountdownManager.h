//
//  STCountdownManager.h
//  Common
//  用于所有的倒计时管理
//  Created by calvin on 14-5-9.
//  Copyright (c) 2014年 BuBuGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSLaunchTask.h"

@protocol PSCountdownObserver <NSObject>

/*!
 * 每秒调用一次
 */
- (void)countdown;

@end

@interface PSCountdownManager : NSObject <PSLaunchTask>

+ (PSCountdownManager *)sharedInstance;

- (void)addObserver:(id<PSCountdownObserver>)observer;
- (void)removeObserver:(id<PSCountdownObserver>)observer;

@end
