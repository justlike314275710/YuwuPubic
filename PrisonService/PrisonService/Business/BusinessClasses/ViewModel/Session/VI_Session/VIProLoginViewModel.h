//
//  VIProLoginViewModel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/8/9.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"

@interface VIProLoginViewModel : PSViewModel
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *loginPwd;
@property (nonatomic, strong) NSString*msg;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray *accountNumbers;

- (void)requestVietnamPreLoginCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
@end
