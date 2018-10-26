//
//  PSAccountEditAddressViewModel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSUserSession.h"
@interface PSAccountEditAddressViewModel : PSViewModel

@property (nonatomic , strong) NSString *address;
@property (nonatomic, strong) PSUserSession *session;
@property (nonatomic , strong) NSString *msg;
@property (nonatomic , assign) NSInteger code;

- (void)requestAccountAdressCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
@end
