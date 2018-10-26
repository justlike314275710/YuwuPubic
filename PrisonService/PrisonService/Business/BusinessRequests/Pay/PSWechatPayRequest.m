//
//  PSWechatPayRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSWechatPayRequest.h"

@implementation PSWechatPayRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"wxpay";
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/weixin/";
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [parameters addParameter:self.itemName forKey:@"itemName"];
    [parameters addParameter:[NSString stringWithFormat:@"%f",self.amount] forKey:@"amount"];
    [parameters addParameter:[NSString stringWithFormat:@"%ld",(long)self.num] forKey:@"num"];
    [parameters addParameter:self.itemId forKey:@"itemId"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSWechatPayResponse class];
}

@end
