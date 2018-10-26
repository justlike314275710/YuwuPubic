//
//  PSProfileRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/10/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSProfileRequest.h"
#import "PSProfileResponse.h"
@implementation PSProfileRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"profile";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSProfileResponse class];
}
@end
