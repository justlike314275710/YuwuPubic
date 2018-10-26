//
//  PSSession.m
//  Common
//
//  Created by calvin on 14-4-3.
//  Copyright (c) 2014年 BuBuGao. All rights reserved.
//

#import "PSSession.h"

@interface PSSession () <PSPassportDelegate>
@property (nonatomic, copy) PSAutoLoginFinished finished;

@end

@implementation PSSession

+ (PSSession *)sharedInstance {
    static PSSession *session = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        if (!session) {
            session = [[PSSession alloc] init];
        }
    });
    return session;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    _passport.delegate = nil;
}

- (void)doLoginWithPassport:(PSPassport *)passport {
    _passport = passport;
    self.passport.delegate = self;
    [self.passport doLogin];
}

//第三方登录绑定手机
- (void)doBundMobileWithPassport:(PSPassport *)passport
{
    _passport = passport;
    self.passport.delegate = self;
    [self.passport doBundMobile];
}

- (void)synchorInfoWithPassport:(PSPassport *)passport {
    _passport = passport;
    self.passport.delegate = self;
    [self.passport synchorInfo];
}

- (void)doRegisterWithPassport:(PSPassport *)passport {
    _passport = passport;
    self.passport.delegate = self;
    [self.passport doRegister];
}

- (void)getAuthCodeWithPassport:(PSPassport *)passport {
    _passport = passport;
    self.passport.delegate = self;
    [self.passport getAuthCode];
}

- (void)doLogout {
    if (self.isLogin) {
        self.passport.delegate = nil;
        [self.passport doLogout];
    }
}

//- (BOOL)isLogin {
//    if (_passport.usertoken.length > 0) {
//        return YES;
//    }else{
//        return NO;
//    }
//}

#pragma mark - PSPassportDelegate Methods
- (void)passportLoginSuccessful:(PSPassport *)passport {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionLoginSuccessful:)]) {
        [self.delegate sessionLoginSuccessful:passport];
    }
}

- (void)passportLoginFailed:(PSPassport *)passport error:(NSError *)error{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionLoginFailed:error:)]) {
        [self.delegate sessionLoginFailed:passport error:error];
    }
}

- (void)passportNeedVerificationCode:(PSPassport *)passport error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionNeedVerificationCode:error:)]) {
        [self.delegate sessionNeedVerificationCode:passport error:error];
    }
}

- (void)passportNeedVerificationCodeSuccess:(PSPassport *)passport{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionNeedVerificationCodeSuccess:)]) {
        [self.delegate sessionNeedVerificationCodeSuccess:passport];
    }
}

- (void)passportLogoutSuccessful:(PSPassport *)passport {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionLogoutSuccessful:)]) {
        [self.delegate sessionLogoutSuccessful:passport];
    }
}

- (void)passportLogoutFailed:(PSPassport *)passport error:(NSError *)error{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionLogoutFailed:error:)]) {
        [self.delegate sessionLogoutFailed:passport error:error];
    }
}

- (void)passportGetAuthCodeSuccessful:(PSPassport *)passport nextAuthCodeSeconds:(NSInteger)seconds seq:(NSString *)seq {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionGetAuthCodeSuccessful:nextAuthCodeSeconds:seq:)]) {
        [self.delegate sessionGetAuthCodeSuccessful:passport nextAuthCodeSeconds:seconds seq:seq];
    }
}

- (void)passportGetAuthCodeFailed:(PSPassport *)passport error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionGetAuthCodeFailed:error:)]) {
        [self.delegate sessionGetAuthCodeFailed:passport error:error];
    }
}
/**
 *  手机注册成功
 *
 *  @param passport <#passport description#>
 */
- (void)passportAuthSuccessful:(PSPassport *)passport {
//    [self autoLogin:^(BOOL successful) {}];
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionAuthSuccessful:)]) {
        [self.delegate sessionAuthSuccessful:passport];
    }
}

- (void)passportAuthFailed:(PSPassport *)passport error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionAuthFailed:error:)]) {
        [self.delegate sessionAuthFailed:passport error:error];
    }
}

- (void)passportRequestAuthorizationSuccessful:(PSPassport *)passport {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionRequestAuthorizationSuccessful:)]) {
        [self.delegate sessionRequestAuthorizationSuccessful:passport];
    }
}

- (void)passportRequestAuthorizationFailed:(PSPassport *)passport error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionRequestAuthorizationFailed:error:)]) {
        [self.delegate sessionRequestAuthorizationFailed:passport error:error];
    }
}


//注册用户信息成功
- (void)passportRegisterUserInfoSuccessful:(PSPassport *)passport{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionRegisterUserInfoSuccessful:)]) {
        [self.delegate sessionRegisterUserInfoSuccessful:passport];
    }
}

//注册用户信息失败
- (void)passportRegisterUserInfoFailed:(PSPassport *)passport error:(NSError *)error{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionRegisterUserInfoFailed:error:)]) {
        [self.delegate sessionRegisterUserInfoFailed:passport error:error];
    }
}

- (void)passportBundMobileSuccessful:(PSPassport *)passport
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionBundMobileSuccessful:)]) {
        [self.delegate sessionBundMobileSuccessful:passport];
    }
}

- (void)passportBundMobileFailed:(PSPassport *)passport error:(NSError *)error
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionBundMobileFailed:error:)]) {
        [self.delegate sessionBundMobileFailed:passport error:error];
    }
}

//三方登录同步用户信息
- (void)passportSynchorInfoSuccessful:(PSPassport *)passport {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionSynchroInfoSuccessful:)]) {
        [self.delegate sessionSynchroInfoSuccessful:passport];
    }
}
//三方登录同步用户信息失败
- (void)passportSynchorInfoFailed:(PSPassport *)passport error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sessionSynchorInfoFailed:error:)]) {
        [self.delegate sessionSynchorInfoFailed:passport error:error];
    }
}

@end
