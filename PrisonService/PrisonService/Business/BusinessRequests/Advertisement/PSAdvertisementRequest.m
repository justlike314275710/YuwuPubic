//
//  PSAdvertisementRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAdvertisementRequest.h"

@implementation PSAdvertisementRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/advertisements/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.type] forKey:@"typeId"];
    [parameters addParameter:self.province forKey:@"province"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSAdvertisementResponse class];
}

@end
