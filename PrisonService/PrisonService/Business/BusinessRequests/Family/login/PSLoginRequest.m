//
//  PSLoginRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLoginRequest.h"

@implementation PSLoginRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"validTourist";
    }
    return self;
}


- (void)buildPostParameters:(PSMutableParameters *)parameters {
//    [parameters addParameter:self.phone forKey:@"phone"];
//    [parameters addParameter:self.uuid forKey:@"uuid"];
    [super buildPostParameters:parameters];
}


- (Class)responseClass {
    return [PSLoginResponse class];
}

@end
