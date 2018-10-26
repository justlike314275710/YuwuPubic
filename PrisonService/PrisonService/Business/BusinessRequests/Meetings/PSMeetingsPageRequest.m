//
//  PSMeetingsPageRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingsPageRequest.h"

@implementation PSMeetingsPageRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:self.name forKey:@"name"];
    [parameters addParameter:self.prisonerId forKey:@"prisonerId"];
    [parameters addParameter:self.uuid forKey:@"uuid"];
    [parameters addParameter:self.ym forKey:@"ym"];
    [parameters addParameter:self.ymd forKey:@"ymd"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSMeetingsPageResponse class];
}

@end
