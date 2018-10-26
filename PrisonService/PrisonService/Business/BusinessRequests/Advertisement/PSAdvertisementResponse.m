//
//  PSAdvertisementResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAdvertisementResponse.h"

@implementation PSAdvertisementResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"advertisements":@"data.advertisements"}];
}

@end
