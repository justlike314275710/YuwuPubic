//
//  PSNewsRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSNewsRequest.h"

@implementation PSNewsRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodGet;
        self.serviceName = @"page";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/news/";
}

- (void)buildParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.rows] forKey:@"rows"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.type] forKey:@"type"];
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [super buildParameters:parameters];
}

- (Class)responseClass {
    return [PSNewsResponse class];
}

@end
