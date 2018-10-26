//
//  PSCheckCodeRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCheckCodeRequest.h"

@implementation PSCheckCodeRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"checkCode";
    }
    return self;
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.phone forKey:@"phone"];
    [parameters addParameter:self.code forKey:@"code"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSCheckCodeResponse class];
}

@end
