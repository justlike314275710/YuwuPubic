//
//  PSPurchaseViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSPurchase.h"

@interface PSPurchaseViewModel : PSViewModel

@property (nonatomic, strong, readonly) NSArray *purchases;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) BOOL hasNextPage;

- (void)refreshPurchaseCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)loadMorePurchaseCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
