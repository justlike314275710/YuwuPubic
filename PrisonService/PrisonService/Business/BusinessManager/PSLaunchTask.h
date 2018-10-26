//
//  PSLaunchTask.h
//  PrisonService
//
//  Created by calvin on 2018/4/3.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LaunchTaskCompletion)(BOOL completed);

@protocol PSLaunchTask <NSObject>

- (void)launchTaskWithCompletion:(LaunchTaskCompletion)completion;
@optional
- (NSString *)taskName;

@end
