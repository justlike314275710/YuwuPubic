//
//  PSRegisterRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRegisterRequest.h"

@implementation PSRegisterRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"perfect";
    }
    return self;
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.name forKey:@"name"];
    [parameters addParameter:self.phone forKey:@"phone"];
    [parameters addParameter:self.gender forKey:@"gender"];
    [parameters addParameter:self.uuid forKey:@"uuid"];
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [parameters addParameter:self.prisonerNumber forKey:@"prisonerNumber"];
    [parameters addParameter:self.relationship forKey:@"relationship"];
    [parameters addParameter:self.avatarUrl forKey:@"avatarUrl"];
    [parameters addParameter:self.idCardFront forKey:@"idCardFront"];
    [parameters addParameter:self.idCardBack forKey:@"idCardBack"];
    [parameters addParameter:self.relationUrl forKey:@"relationalProofUrl"];
    [parameters addParameter:self.type forKey:@"type"];
    [super buildPostParameters:parameters];
}



- (Class)responseClass {
    return [PSRegisterResponse class];
}

@end
