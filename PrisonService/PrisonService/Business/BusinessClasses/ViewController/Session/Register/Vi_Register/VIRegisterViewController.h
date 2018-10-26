//
//  VIRegisterViewController.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/8/7.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
#import "PSSessionHandler.h"
@interface VIRegisterViewController : PSBusinessViewController<PSSessionHandler>
@property (nonatomic, copy) SessionHandlerCallback callback;
@property (nonatomic, strong)NSString* typeShow;
@end
