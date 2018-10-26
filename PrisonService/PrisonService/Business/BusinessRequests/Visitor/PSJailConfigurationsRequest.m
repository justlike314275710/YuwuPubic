//
//  PSJailConfigurationsRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSJailConfigurationsRequest.h"

@implementation PSJailConfigurationsRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"getJailConfigurations";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSJailConfigurationsResponse class];
}

@end
