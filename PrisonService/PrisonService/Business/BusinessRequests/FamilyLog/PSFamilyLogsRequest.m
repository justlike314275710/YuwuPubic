//
//  PSFamilyLogsRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyLogsRequest.h"

@implementation PSFamilyLogsRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/family_logs/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [parameters addParameter:self.prisonerId forKey:@"prisonerId"];
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSFamilyLogsResponse class];
}

@end
