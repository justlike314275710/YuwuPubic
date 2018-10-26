//
//  PSPrisonerFamiliesResponse.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonerFamiliesResponse.h"

@implementation PSPrisonerFamiliesResponse
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"prisonerFamilies":@"data.prisonerFamilies"}];
}
@end
