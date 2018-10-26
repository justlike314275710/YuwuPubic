//
//  PSPeriodChangeViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/26.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseServiceViewModel.h"
#import "PSPeriodChange.h"

@interface PSPeriodChangeViewModel : PSBaseServiceViewModel

@property (nonatomic, strong, readonly) NSArray *periodChanges;

- (void)refreshPeriodChangesCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)loadMorePeriodChangesCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
