//
//  PSPassport.m
//  Common
//
//  Created by calvin on 14-4-23.
//  Copyright (c) 2014年 BuBuGao. All rights reserved.
//

#import "PSPassport.h"

@implementation PSPassport

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.loginID = [aDecoder decodeObjectForKey:@"loginID"];
        self.usertoken = [aDecoder decodeObjectForKey:@"usertoken"];
        self.imId = [aDecoder decodeObjectForKey:@"imId"];
        self.imToken = [aDecoder decodeObjectForKey:@"imToken"];
        self.decryptedImToken = [aDecoder decodeObjectForKey:@"decryptedImToken"];
        self.type = [aDecoder decodeIntegerForKey:@"type"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.loginID forKey:@"loginID"];
    [aCoder encodeObject:self.usertoken forKey:@"usertoken"];
    [aCoder encodeObject:self.imId forKey:@"imId"];
    [aCoder encodeObject:self.imToken forKey:@"imToken"];
    [aCoder encodeObject:self.decryptedImToken forKey:@"decryptedImToken"];
    [aCoder encodeInteger:self.type forKey:@"type"];
}

- (void)setLoginID:(NSString *)loginID {
    _loginID = loginID;
}

- (void)setUsertoken:(NSString *)usertoken {
    _usertoken = usertoken;
}

- (void)setType:(PSPassportType)type {
    _type = type;
}

- (void)setNewUser:(BOOL)newUser {
    _newUser = newUser;
}

- (void)setImId:(NSString *)imId {
    _imId = imId;
}

- (void)setImToken:(NSString *)imToken {
    _imToken = imToken;
}

- (void)doLogin {
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：doLogin" userInfo:nil];
}

- (void)getAuthCode {
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：getAuthCode" userInfo:nil];
}

- (void)doVerify {
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：doVerify" userInfo:nil];
}

- (void)doRegister {
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：doRegister" userInfo:nil];
}

- (void)doLogout {
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：doLogout" userInfo:nil];
}

- (void)doRegisterUserInfo{
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：doRegisterUserInfo" userInfo:nil];
}

- (void)doBundMobile
{
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：doBundMobile" userInfo:nil];
}

- (void)synchorInfo {
    @throw [NSException exceptionWithName:@"实现抽象方法" reason:@"没有实现抽象方法：synchorInfo" userInfo:nil];
}

@end
