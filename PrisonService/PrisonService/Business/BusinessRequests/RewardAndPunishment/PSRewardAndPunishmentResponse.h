//
//  PSRewardAndPunishmentResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSRewardAndPunishment.h"

@interface PSRewardAndPunishmentResponse : PSResponse

@property (nonatomic, strong) NSArray<PSRewardAndPunishment,Optional> *prisonerRewardPunishments;

@end
