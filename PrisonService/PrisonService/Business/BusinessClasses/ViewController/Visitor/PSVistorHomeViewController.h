//
//  PSVistorHomeViewController.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
#import "PSSessionHandler.h"
@interface PSVistorHomeViewController : PSBusinessViewController<PSSessionHandler>
@property(nonatomic,strong)NSArray*functions;
@property (nonatomic, copy) SessionHandlerCallback callback;
@end
