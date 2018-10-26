//
//  PSProfileResponse.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/10/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSProfileResponse.h"

@implementation PSProfileResponse
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"profile":@"data.profile"}];
}
@end
