//
//  PSMeetingMembersResponse.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/18.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingMembersResponse.h"

@implementation PSMeetingMembersResponse
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"meetingMembers":@"data.meetingMembers"}];
}
@end
