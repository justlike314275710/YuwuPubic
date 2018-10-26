//
//  PSFamilyLogsResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyLogsResponse.h"

@implementation PSFamilyLogsResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"logs":@"data.logs"}];
}

@end
