//
//  PSMeetingsPageResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingsPageResponse.h"

@implementation PSMeetingsPageResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"meetings":@"data.meetings"}];
}

@end
