//
//  PSVisitorJailsRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorJailsRequest.h"

@implementation PSVisitorJailsRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"all";
    }
    return self;
}

- (Class)responseClass {
    return [PSVisitorJailsResponse class];
}

@end
