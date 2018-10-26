//
//  PSJailConfigurationsResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSJailConfigurationsResponse.h"

@implementation PSJailConfigurationsResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"settings":@"data.settings",@"jailName":@"data.jailName"}];
}

- (void)setSettings:(NSString<Optional> *)settings {
    _settings = settings;
    _configuration = [[PSJailConfiguration alloc] initWithString:settings error:nil];
}

@end
