//
//  PSRewardAndPunishmentViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseServiceViewModel.h"
#import "PSRewardAndPunishment.h"

@interface PSRewardAndPunishmentViewModel : PSBaseServiceViewModel

@property (nonatomic, strong, readonly) NSArray *rewardsAndPunishments;

- (void)refreshRewardsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)loadMoreRewardsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
