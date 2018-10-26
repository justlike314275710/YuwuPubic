//
//  PSPinmoneyRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPinmoneyRequest.h"
#import "PSPinmoneyResponse.h"
@implementation PSPinmoneyRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/pocket_money/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [parameters addParameter:self.prisonerId forKey:@"prisonerId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSPinmoneyResponse class];
}
@end
