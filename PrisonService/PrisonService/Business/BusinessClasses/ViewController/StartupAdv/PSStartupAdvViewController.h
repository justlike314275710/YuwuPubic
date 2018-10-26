//
//  PSStartupAdvViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/28.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSImageDisplayViewController.h"

typedef void(^StartupAdvCompleted)();

@interface PSStartupAdvViewController : PSImageDisplayViewController

@property (nonatomic, copy) StartupAdvCompleted completed;

@end
