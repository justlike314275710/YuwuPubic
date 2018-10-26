//
//  PSMeetingAddRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingAddRequest.h"

@implementation PSMeetingAddRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"add";
        self.parameterType=PSPostParameterJson;
    }
    return self;
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [parameters addParameter:self.prisonerId forKey:@"prisonerId"];
    [parameters addParameter:self.applicationDate forKey:@"applicationDate"];
    [parameters addParameter:self.charge forKey:@"expense"];
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [parameters addParameter:self.meetingMembers forKey:@"meetingMembers"];
    
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSMeetingAddResponse class];
}

@end
