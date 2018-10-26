//
//  PSPrisonerFamiliesRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonerFamiliesRequest.h"

@implementation PSPrisonerFamiliesRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"prisonerFamilies";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.prisonerId forKey:@"prisonerId"];
    [super buildParameters:parameters];
}

- (NSString *)businessDomain {
    return @"/api/prisoners/";
}

- (Class)responseClass {
    return [PSPrisonerFamiliesResponse class];
}
@end
