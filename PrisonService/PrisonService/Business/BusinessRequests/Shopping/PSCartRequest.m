//
//  PSShoppingRequest.m
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.


#import "PSCartRequest.h"

@implementation PSCartRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/pay_request/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSCartResponse class];
}

@end
