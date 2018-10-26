//
//  PSBindPrisonerRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBindPrisonerRequest.h"

@implementation PSBindPrisonerRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"binding";
    }
    return self;
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [parameters addParameter:self.relationship forKey:@"relationship"];
    [parameters addParameter:self.prisonerNumber forKey:@"prisonerNumber"];
    [parameters addParameter:self.relationalProofUrl forKey:@"relationalProofUrl"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSBindPrisonerResponse class];
}

@end
