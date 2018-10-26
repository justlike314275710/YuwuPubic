//
//  PSApiSign.m
//  Start
//
//  Created by calvin on 17/1/9.
//  Copyright © 2017年 DingSNS. All rights reserved.
//

#import "PSApiSign.h"
#import "OpenUDID.h"
#import "PSNetConstants.h"
#import "PSSession.h"
#import "NSString+Encryption.h"

@implementation PSApiSign
- (id)init {
    self = [super init];
    if (self) {
        NSMutableDictionary *publicParams = [self buildPublicParameters];
        _publicParameters = [publicParams copy];
        if ([PSSession sharedInstance].isLogin) {
            [publicParams setObject:[PSSession sharedInstance].passport.usertoken forKey:@"token"];
        }
        _publicAndTokenParameters = [publicParams copy];
    }
    return self;
}

- (NSString *)sortedStringOfParameters:(NSDictionary *)parameters {
    if ([parameters count] == 0) return @"";
    NSDictionary *copyParameters = [parameters copy];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedKeys = [[copyParameters allKeys] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    NSMutableString *sortString = [NSMutableString stringWithString:@""];
    for (NSString *key in sortedKeys) {
        NSString *value = [copyParameters objectForKey:key];
        [sortString appendString:key];
        [sortString appendString:value];
    }
    return sortString;
}

- (NSMutableDictionary *)buildPublicParameters {
    NSMutableDictionary *publicParameters = [NSMutableDictionary dictionary];
    //时间戳
    [publicParameters setObject:[NSString stringWithFormat:@"%lld",(long long)([[NSDate date] timeIntervalSince1970] * 1000)] forKey:@"timestamp"];
    //设备唯一标识
    [publicParameters setObject:[OpenUDID value] forKey:@"deviceId"];
    //系统版本
    [publicParameters setObject:[UIDevice currentDevice].systemVersion forKey:@"osVersion"];
    //系统类型
    [publicParameters setObject:PSPLATFORM forKey:@"osType"];
    //App对外版本号
    [publicParameters setObject:SHORTVERSION forKey:@"appVersion"];
    //BundleID
    [publicParameters setObject:[[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"] forKey:@"bundleId"];
    return publicParameters;
}

- (NSString *)signGetMethodWithParameters:(NSDictionary *)parameters {
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [allParameters addEntriesFromDictionary:[self publicParameters]];
    NSString *sortedString = [self sortedStringOfParameters:allParameters];
    NSMutableString *signString = [NSMutableString stringWithString:@""];
    //拼接token
    if ([PSSession sharedInstance].isLogin) {
        [signString appendString:[PSSession sharedInstance].passport.usertoken];
    }
    //拼接排序后的所有参数
    [signString appendString:sortedString];
    return [signString md5String];
}

- (NSString *)signPostMethodWithParameters:(NSDictionary *)parameters {
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionary];
    [allParameters addEntriesFromDictionary:[self publicParameters]];
    NSString *sortedString = [self sortedStringOfParameters:allParameters];
    NSMutableString *signString = [NSMutableString stringWithString:@""];
    //拼接token
    if ([PSSession sharedInstance].isLogin) {
        [signString appendString:[PSSession sharedInstance].passport.usertoken];
    }
    //拼接排序后的所有参数
    [signString appendString:sortedString];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    if (!error) {
        [signString appendString:[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]];
    }
    return [signString md5String];
}

@end
