//
//  PSShoppingResponse.m
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCartResponse.h"

@implementation PSCartResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"purchases":@"data.echages"}];
}

@end
