//
//  PSJailsRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSJailsRequest.h"

@implementation PSJailsRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"list";
    }
    return self;
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    NSArray *langArr = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSString *language = langArr.firstObject;
    if ([language isEqualToString:@"vi-US"]||[language isEqualToString:@"vi-CN"]||[language isEqualToString:@"vi-VN"]) {
        self.language=@"vie";
    }
    else{
        self.language=@"zh";
    }
    [parameters addParameter:self.language forKey:@"language"];
    [parameters addParameter:self.provinces forKey:@"provinces"];
    [parameters addParameter:self.citys forKey:@"citys"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSJailsResponse class];
}

@end
