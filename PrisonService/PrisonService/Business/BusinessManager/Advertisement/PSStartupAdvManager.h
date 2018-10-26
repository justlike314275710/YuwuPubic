//
//  STStartupAdManager.h
//  Start
//
//  Created by Glen on 16/8/24.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSLaunchTask.h"

@interface PSStartupAdvManager : NSObject <PSLaunchTask>

+ (PSStartupAdvManager *)sharedInstance;

@end
