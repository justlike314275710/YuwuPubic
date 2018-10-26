//
//  PSPrisonerTermsRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/26.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonerTermsRequest.h"

@implementation PSPrisonerTermsRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/prison_terms/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [parameters addParameter:self.prisonerId forKey:@"prisonerId"];
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSPrisonerTermsResponse class];
}

@end
