//
//  PSUploadAvatarRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUploadAvatarRequest.h"
#import "PSBusinessConstants.h"

@implementation PSUploadAvatarRequest

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
    [parameters addParameter:self.avatarData forKey:@"avatar"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSUploadAvatarResponse class];
}

@end
