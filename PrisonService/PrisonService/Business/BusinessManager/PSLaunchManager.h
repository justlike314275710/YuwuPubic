//
//  PSLaunchManager.h
//  PrisonService
//
//  Created by calvin on 2018/4/3.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSLaunchTask.h"
#import "PSLaunchObserver.h"

@interface PSLaunchManager : NSObject<PSLaunchTask>

+ (PSLaunchManager *)sharedInstance;
/**
 *  添加观察者
 *
 *  @param observer 观察者
 */
- (void)addObserver:(id<PSLaunchObserver>)observer;
/**
 *  移除观察者
 *
 *  @param observer 观察者
 */
- (void)removeObserver:(id<PSLaunchObserver>)observer;
/**
 *  任务队列添加任务
 *
 *  @param task 任务
 */
- (void)addTask:(id<PSLaunchTask>)task;
/**
 *  任务队列移除任务
 *
 *  @param task 任务
 */
- (void)removeTask:(id<PSLaunchTask>)task;
/**
 *  移除队列所有任务
 *
 */
- (void)clearAllTasks;
/**
 *  全新启动App
 */
- (void)launchApplication;
/**
 *  注销帐户后启动
 */
- (void)launchFromLogout;


-(void)launchLoginStatus;
@end
