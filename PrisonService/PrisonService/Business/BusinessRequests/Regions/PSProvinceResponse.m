//
//  PSProvinceResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSProvinceResponse.h"

@implementation PSProvinceResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"provinces":@"data.provinces"}];
}

@end
