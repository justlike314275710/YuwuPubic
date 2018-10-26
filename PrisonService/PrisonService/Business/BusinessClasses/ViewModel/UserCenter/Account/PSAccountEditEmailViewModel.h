//
//  PSAccountEmailViewModel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSUserSession.h"

@interface PSAccountEditEmailViewModel:PSViewModel
@property (nonatomic, strong) PSUserSession *session;
@property (nonatomic , strong) NSString *email;


@property (nonatomic , strong) NSString *msg;
@property (nonatomic , assign) NSInteger code;
- (void)requestAccountEmailCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
