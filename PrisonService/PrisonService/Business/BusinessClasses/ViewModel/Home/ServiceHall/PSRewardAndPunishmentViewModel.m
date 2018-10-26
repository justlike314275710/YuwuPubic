//
//  PSRewardAndPunishmentViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRewardAndPunishmentViewModel.h"
#import "PSRewardAndPunishmentRequest.h"

@interface PSRewardAndPunishmentViewModel ()

@property (nonatomic, strong) PSRewardAndPunishmentRequest *rewardsRequest;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation PSRewardAndPunishmentViewModel
@synthesize dataStatus = _dataStatus;
- (NSArray *)rewardsAndPunishments {
    return _items;
}

- (void)refreshRewardsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page = 1;
    self.items = nil;
    self.hasNextPage = NO;
    self.dataStatus = PSDataInitial;
    [self requestRewardsCompleted:completedCallback failed:failedCallback];
}

- (void)loadMoreRewardsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page ++;
    [self requestRewardsCompleted:completedCallback failed:failedCallback];
}

- (void)requestRewardsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.rewardsRequest = [PSRewardAndPunishmentRequest new];
    self.rewardsRequest.page = self.page;
    self.rewardsRequest.rows = self.pageSize;
    self.rewardsRequest.prisonerId = self.prisonerDetail.prisonerId;
    self.rewardsRequest.jailId = self.prisonerDetail.jailId;
    @weakify(self)
    [self.rewardsRequest send:^(PSRequest *request, PSResponse *response) {
        @strongify(self)
        if (response.code == 200) {
            PSRewardAndPunishmentResponse *rewardsResponse = (PSRewardAndPunishmentResponse *)response;
            if (self.page == 1) {
                self.items = [NSMutableArray array];
            }
            if (rewardsResponse.prisonerRewardPunishments.count == 0) {
                self.dataStatus = PSDataEmpty;
            }else{
                self.dataStatus = PSDataNormal;
            }
            self.hasNextPage = rewardsResponse.prisonerRewardPunishments.count >= self.pageSize;
            [self.items addObjectsFromArray:rewardsResponse.prisonerRewardPunishments];
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
