//
//  PSGuideViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/28.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSImageDisplayViewController.h"

typedef void(^GuideCompleted)();

@interface PSGuideViewController : PSImageDisplayViewController

@property (nonatomic, copy) GuideCompleted completed;

@end
