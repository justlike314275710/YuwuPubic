//
//  PSVisitorJailsResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorJailsResponse.h"

@implementation PSVisitorJailsResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"provinces":@"data.provinces"}];
}

@end
