//
//  PSAccountViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/11.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSAccountInfoItem.h"
#import "PSPrisonerDetail.h"
#import "PSUserSession.h"
@interface PSAccountViewModel : PSViewModel
@property (nonatomic , strong) NSString *gender;
@property (nonatomic , strong) NSString *postalCode;
@property (nonatomic , strong) NSString *homeAddress;
@property (nonatomic, strong)  PSUserSession *session;
@property (nonatomic, strong, readonly) NSArray *infoItems;
- (void)requestAccountBasicinfoCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
@end
