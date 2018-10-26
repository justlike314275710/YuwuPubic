//
//  PSMeetingMembersRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/18.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingMembersRequest.h"

@implementation PSMeetingMembersRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"meetingMembers";
    }
    return self;
}



- (void)buildParameters:(PSMutableParameters *)parameters {
    
    [parameters addParameter:self.meetingId forKey:@"meetingId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSMeetingMembersResponse class];
}
@end
