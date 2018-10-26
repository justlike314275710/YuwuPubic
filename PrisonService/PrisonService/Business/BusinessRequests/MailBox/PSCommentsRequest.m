//
//  PSCommentsRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCommentsRequest.h"

@implementation PSCommentsRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"comments";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.suggestionID forKey:@"id"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSCommentsResponse class];
}

@end
