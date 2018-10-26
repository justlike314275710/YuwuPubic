//
//  PSPeriodChangeViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/26.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPeriodChangeViewModel.h"
#import "PSPrisonerTermsRequest.h"

@interface PSPeriodChangeViewModel ()

@property (nonatomic, strong) PSPrisonerTermsRequest *termsRequest;
@property (nonatomic, strong) NSMutableArray *periods;

@end

@implementation PSPeriodChangeViewModel
@synthesize dataStatus = _dataStatus;
- (NSArray *)periodChanges {
    return _periods;
}

- (void)refreshPeriodChangesCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page = 1;
    self.periods = nil;
    self.hasNextPage = NO;
    self.dataStatus = PSDataInitial;
    [self requestPeriodChangesCompleted:completedCallback failed:failedCallback];
}

- (void)loadMorePeriodChangesCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page ++;
    [self requestPeriodChangesCompleted:completedCallback failed:failedCallback];
}

- (void)requestPeriodChangesCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.termsRequest = [PSPrisonerTermsRequest new];
    self.termsRequest.page = self.page;
    self.termsRequest.rows = self.pageSize;
    self.termsRequest.prisonerId = self.prisonerDetail.prisonerId;
    self.termsRequest.jailId = self.prisonerDetail.jailId;
    @weakify(self)
    [self.termsRequest send:^(PSRequest *request, PSResponse *response) {
        @strongify(self)
        if (response.code == 200) {
            PSPrisonerTermsResponse *termsResponse = (PSPrisonerTermsResponse *)response;
            if (self.page == 1) {
                self.periods = [NSMutableArray array];
            }
            if (termsResponse.periods.count == 0) {
                self.dataStatus = PSDataEmpty;
            }else{
                self.dataStatus = PSDataNormal;
            }
            self.hasNextPage = termsResponse.periods.count >= self.pageSize;
            [self.periods addObjectsFromArray:termsResponse.periods];
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
