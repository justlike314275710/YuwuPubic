//
//  PSMeetCancelRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/8/3.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetCancelRequest.h"
#import "PSMeetCancelResponse.h"
@implementation PSMeetCancelRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"applyCancel";
        
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/meetings/";
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.ID forKey:@"ID"];
    [parameters addParameter:self.cause forKey:@"cause"];
    [super buildParameters:parameters];
}


- (Class)responseClass {
    return [PSMeetCancelResponse class];
}
@end
