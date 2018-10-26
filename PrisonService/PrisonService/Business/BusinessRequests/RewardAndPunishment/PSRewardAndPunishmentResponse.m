//
//  PSRewardAndPunishmentResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRewardAndPunishmentResponse.h"

@implementation PSRewardAndPunishmentResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"prisonerRewardPunishments":@"data.prisonerRewardPunishments"}];
}

@end
