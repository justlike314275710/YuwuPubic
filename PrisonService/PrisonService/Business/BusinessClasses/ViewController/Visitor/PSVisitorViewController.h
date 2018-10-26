//
//  PSVisitorViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
#import "PSVisitorHandler.h"

@interface PSVisitorViewController : PSBusinessViewController<PSVisitorHandler>

@property (nonatomic, copy) VisitorHandler callback;

@end
