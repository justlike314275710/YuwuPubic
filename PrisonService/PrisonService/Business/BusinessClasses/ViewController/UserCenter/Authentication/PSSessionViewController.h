//
//  PSSessionViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/9.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSNavigationController.h"
#import "PSSessionHandler.h"

@interface PSSessionViewController : PSNavigationController<PSSessionHandler>

@property (nonatomic, copy) SessionHandlerCallback callback;

@end
