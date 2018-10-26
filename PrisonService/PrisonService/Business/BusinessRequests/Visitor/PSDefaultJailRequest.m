//
//  PSDefaultJailRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/10/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSDefaultJailRequest.h"
#import "PSDefaultJailResponse.h"
@implementation PSDefaultJailRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"defaultJail";
    }
    return self;
}



- (Class)responseClass {
    return [PSDefaultJailResponse class];
}
@end
