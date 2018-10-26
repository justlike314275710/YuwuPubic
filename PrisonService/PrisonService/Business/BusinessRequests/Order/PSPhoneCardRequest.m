//
//  PSPhoneCardRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPhoneCardRequest.h"

@implementation PSPhoneCardRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"getKinshipPhoneCard";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSPhoneCardResponse class];
}

@end
