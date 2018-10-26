//
//  PSPurchaseViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPurchaseViewModel.h"
#import "PSCartRequest.h"
#import "PSSessionManager.h"

@interface PSPurchaseViewModel ()

@property (nonatomic, strong) PSCartRequest *cartRequest;
@property (nonatomic, strong) NSMutableArray *purchaseArray;

@end

@implementation PSPurchaseViewModel
@synthesize dataStatus = _dataStatus;
- (id)init {
    self = [super init];
    if (self) {
        self.page = 1;
        self.pageSize = 10;
    }
    return self;
}

- (NSArray *)purchases {
    return _purchaseArray;
}

- (void)refreshPurchaseCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page = 1;
    self.purchaseArray = nil;
    self.hasNextPage = NO;
    self.dataStatus = PSDataInitial;
    [self requestPurchaseCompleted:completedCallback failed:failedCallback];
}

- (void)loadMorePurchaseCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page ++;
    [self requestPurchaseCompleted:completedCallback failed:failedCallback];
}

- (void)requestPurchaseCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.cartRequest = [PSCartRequest new];
    self.cartRequest.page = self.page;
    self.cartRequest.rows = self.pageSize;
    self.cartRequest.familyId = [PSSessionManager sharedInstance].session.families.id;
    @weakify(self)
    [self.cartRequest send:^(PSRequest *request, PSResponse *response) {
        @strongify(self)
        if (response.code == 200) {
            PSCartResponse *cartResponse = (PSCartResponse *)response;
            if (self.page == 1) {
                self.purchaseArray = [NSMutableArray array];
            }
            if (cartResponse.purchases.count == 0) {
                self.dataStatus = PSDataEmpty;
            }else{
                self.dataStatus = PSDataNormal;
            }
            self.hasNextPage = cartResponse.purchases.count >= self.pageSize;
            [self.purchaseArray addObjectsFromArray:cartResponse.purchases];
        }else{
            if (self.page > 1) {
                self.page --;
                self.hasNextPage = YES;
            }else{
                self.dataStatus = PSDataError;
            }
        }
        if (completedCallback) {
            completedCallback(response);
        }
    } errorCallback:^(PSRequest *request, NSError *error) {
        @strongify(self)
        if (self.page > 1) {
            self.page --;
            self.hasNextPage = YES;
        }else{
            self.dataStatus = PSDataError;
        }
        if (failedCallback) {
            failedCallback(error);
        }
    }];
}

@end
