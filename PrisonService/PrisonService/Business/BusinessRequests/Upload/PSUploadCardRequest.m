//
//  PSUploadCardRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUploadCardRequest.h"
#import "PSBusinessConstants.h"

@implementation PSUploadCardRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/uuids";
}

- (void)buildHeaders:(PSMutableParameters *)headers {
    [headers addParameter:AppToken forKey:@"Authorization"];
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.cardData forKey:@"uuid"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSUploadCardResponse class];
}

@end
