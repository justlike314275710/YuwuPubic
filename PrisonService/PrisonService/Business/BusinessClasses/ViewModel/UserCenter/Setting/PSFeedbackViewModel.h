//
//  PSFeedbackViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"

@interface PSFeedbackViewModel : PSViewModel

@property (nonatomic, strong) NSString *content;

- (void)sendFeedbackCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
