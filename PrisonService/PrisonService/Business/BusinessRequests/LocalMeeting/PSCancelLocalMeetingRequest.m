//
//  PSCancelLocalMeetingRequest.m
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCancelLocalMeetingRequest.h"

@implementation PSCancelLocalMeetingRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"applyCancel";
    }
    return self;
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.meetingID forKey:@"id"];
    [parameters addParameter:self.cause forKey:@"cause"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSCancelLocalMeetingResponse class];
}

@end
