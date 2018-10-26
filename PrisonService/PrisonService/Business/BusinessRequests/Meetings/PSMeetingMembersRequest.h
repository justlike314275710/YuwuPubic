//
//  PSMeetingMembersRequest.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/18.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingsBaseRequest.h"
#import "PSMeetingMembersResponse.h"
@interface PSMeetingMembersRequest : PSMeetingsBaseRequest
@property (nonatomic , strong) NSString *meetingId;
@end
