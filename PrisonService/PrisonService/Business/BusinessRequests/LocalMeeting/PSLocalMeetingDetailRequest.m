//
//  PSLocalMeetingDetailRequest.m
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLocalMeetingDetailRequest.h"

@implementation PSLocalMeetingDetailRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"pre";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [parameters addParameter:self.prisonerId forKey:@"prisonerId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSLocalMeetingDetailResponse class];
}

@end
