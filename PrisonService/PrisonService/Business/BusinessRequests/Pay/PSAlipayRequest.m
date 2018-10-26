//
//  PSAlipayRequest.m
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAlipayRequest.h"

@implementation PSAlipayRequest

- (id)init {
    self = [super init];
    if (self) {
        self.method = PSHttpMethodPost;
        self.serviceName = @"buyKinshipPhoneCard";
        self.parameterType = PSPostParameterJson;
    }
    return self;
}

- (NSString *)businessDomain {
    return @"/api/alipay/";
}

- (void)buildPostParameters:(PSMutableParameters *)parameters {
    NSArray *lineItemsList = @[@{@"itemName":self.itemName,@"quantity":[NSString stringWithFormat:@"%ld",(long)self.num],@"itemId":self.itemId}];
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [parameters addParameter:self.jailId forKey:@"jailId"];
    [parameters addParameter:self.familyId forKey:@"familyId"];
    [parameters addParameter:[NSString stringWithFormat:@"%f",self.amount] forKey:@"amount"];
    [parameters addParameter:lineItemsList forKey:@"lineItemsList"];
    [super buildPostParameters:parameters];
}

- (Class)responseClass {
    return [PSAlipayResponse class];
}

@end
