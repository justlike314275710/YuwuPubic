//
//  PSDefaultJailResponse.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/10/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSDefaultJailResponse.h"

@implementation PSDefaultJailResponse
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"jailId":@"data.jail.id",@"jailName":@"data.jail.title"}];
}
@end
