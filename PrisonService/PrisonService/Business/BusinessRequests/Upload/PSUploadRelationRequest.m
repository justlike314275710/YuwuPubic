//
//  PSUploadRelationRequest.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUploadRelationRequest.h"
#import "PSBusinessConstants.h"
@implementation PSUploadRelationRequest
- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/avatars";
}

- (void)buildHeaders:(PSMutableParameters *)headers {
    [headers addParameter:AppToken forKey:@"Authorization"];
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.relationData forKey:@"avatar"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSUploadRelationResponse class];
}



@end
