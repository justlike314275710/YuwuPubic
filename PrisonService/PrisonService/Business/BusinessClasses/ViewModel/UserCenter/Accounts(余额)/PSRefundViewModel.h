//
//  PSRefundViewModel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSPrisonerDetail.h"
#import "PSUserSession.h"
@interface PSRefundViewModel : PSViewModel
@property (nonatomic, strong) PSUserSession *session;
@property(nonatomic,strong) NSString*msgData;
- (void)requestRefundCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;//申请退款
@end
