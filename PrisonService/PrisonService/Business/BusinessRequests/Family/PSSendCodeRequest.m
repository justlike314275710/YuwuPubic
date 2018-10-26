//
//  PSSendCodeRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/18.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSSendCodeRequest.h"

@implementation PSSendCodeRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"sendCode";
    }
    return self;
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.phone forKey:@"phone"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSSendCodeResponse class];
}

@end
