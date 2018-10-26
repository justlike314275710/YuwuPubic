//
//  PSJailConfiguration.m
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSJailConfiguration.h"

@implementation PSJailConfiguration

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"face_recognition":@"modules.face_recognition"}];
}

@end
