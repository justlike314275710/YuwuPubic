//
//  PSValidTouristRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/8/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSValidTouristRequest.h"

@implementation PSValidTouristRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"validTourist";
    }
    return self;
}

- (void)buildHeaders:(PSMutableParameters *)headers {
    [headers addParameter:[LXFileManager readUserDataForKey:@"access_token"] forKey:@"Authorization"];
    [super buildHeaders:headers];
}

- (Class)responseClass {
    return [PSValidTouristResponse class];
}
@end
