//
//  PSMailBoxesRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMailBoxesRequest.h"

@implementation PSMailBoxesRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSMailBoxesResponse class];
}

@end
