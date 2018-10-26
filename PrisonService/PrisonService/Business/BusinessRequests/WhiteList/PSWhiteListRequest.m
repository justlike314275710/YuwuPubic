//
//  PSWhiteListRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/28.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSWhiteListRequest.h"

@implementation PSWhiteListRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"checkPhone";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/whitenumbers/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.phone forKey:@"phone"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSWhiteListResponse class];
}

@end
