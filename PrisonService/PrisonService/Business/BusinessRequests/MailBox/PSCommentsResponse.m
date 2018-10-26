//
//  PSCommentsResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCommentsResponse.h"

@implementation PSCommentsResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"comments":@"data.comments"}];
}

@end
