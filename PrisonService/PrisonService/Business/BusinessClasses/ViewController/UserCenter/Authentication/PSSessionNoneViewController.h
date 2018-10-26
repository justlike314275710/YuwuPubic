//
//  PSSessionDeniedViewController.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/7.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
#import "PSSessionHandler.h"
#import "PSUserSession.h"
#import "PSTipsConstants.h"

@interface PSSessionNoneViewController : PSBusinessViewController<PSSessionHandler>
@property (nonatomic, copy) SessionHandlerCallback callback;
@property (nonatomic, strong) PSUserSession *session;
@property (nonatomic, assign, readonly) PSLoginStatus loginStatus;
@end
