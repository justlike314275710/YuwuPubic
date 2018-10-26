//
//  PSPinmoneyViewModel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSUserSession.h"
@interface PSPinmoneyViewModel : PSViewModel
@property (nonatomic, strong,readonly) NSArray *Pinmoneys;
@property (nonatomic, strong) PSUserSession *session;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) BOOL hasNextPage;


- (void)refreshPinmoneyCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)loadMorePinmoneyCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;




@end
