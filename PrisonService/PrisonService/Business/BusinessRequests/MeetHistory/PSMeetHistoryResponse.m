//
//  PSMeetHistoryResponse.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetHistoryResponse.h"

@implementation PSMeetHistoryResponse
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"history":@"data.history"}];
}




@end
