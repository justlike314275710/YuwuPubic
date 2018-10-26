//
//  PSPreLoginViewModel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"

@interface PSPreLoginViewModel : PSViewModel
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *messageCode;
@property (nonatomic, strong) NSString *loginPwd;
@property (nonatomic, strong) NSString*msg;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray *accountNumbers;
- (void)requestPreLoginCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

- (void)requestVietnamPreLoginCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
@end
