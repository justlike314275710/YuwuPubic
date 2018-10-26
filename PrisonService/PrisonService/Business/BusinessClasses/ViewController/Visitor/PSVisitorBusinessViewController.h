//
//  PSVisitorBusinessViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/9.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSNavigationController.h"
#import "PSVisitorHandler.h"
#import "PSVisitorViewModel.h"

@interface PSVisitorBusinessViewController : PSNavigationController<PSVisitorHandler>

@property (nonatomic, copy) VisitorHandler callback;

@end
