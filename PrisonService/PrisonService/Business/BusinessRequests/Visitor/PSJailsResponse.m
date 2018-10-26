//
//  PSJailsResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSJailsResponse.h"

@implementation PSJailsResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"jails":@"data.jails"}];
}

@end
