//
//  PSMeetHistoryRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetHistoryRequest.h"
#import "PSMeetHistoryResponse.h"
@implementation PSMeetHistoryRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"history";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/meetings/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSMeetHistoryResponse class];
}
@end
