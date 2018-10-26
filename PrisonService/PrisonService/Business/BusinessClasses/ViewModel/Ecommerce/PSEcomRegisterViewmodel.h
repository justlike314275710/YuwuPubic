//
//  EcomLoginViewmodel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"

@interface PSEcomRegisterViewmodel : PSViewModel
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *verificationCode;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) NSInteger statusCode;
@property (nonatomic, assign) NSInteger messageCode;

- (void)requestEcomRegisterCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)requestVietnamEcomRegisterCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

-(void)requestCodeCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)checkDataWithCallback:(CheckDataCallback)callback;
- (void)checkPhoneDataWithCallback:(CheckDataCallback)callback;
@end
