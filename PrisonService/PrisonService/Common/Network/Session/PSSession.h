//
//  PSSession.h
//  Common
//
//  Created by calvin on 14-4-3.
//  Copyright (c) 2014年 BuBuGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSPassport.h"
#import "PSCache.h"

typedef void (^PSAutoLoginFinished) (BOOL successful);

@protocol PSSessionDelegate <NSObject>

@optional
//登录成功
- (void)sessionLoginSuccessful:(PSPassport *)passport;
//登录失败
- (void)sessionLoginFailed:(PSPassport *)passport error:(NSError *)error;
//注册成功
- (void)sessionRegisterSuccessful:(PSPassport *)passport;
//注册失败
- (void)sessionRegisterFailed:(PSPassport *)passport error:(NSError *)error;
//需要图形验证码验证
- (void)sessionNeedVerificationCode:(PSPassport *)passport error:(NSError *)error;
//图形验证码验证成功
- (void)sessionNeedVerificationCodeSuccess:(PSPassport *)passport;
//注销成功
- (void)sessionLogoutSuccessful:(PSPassport *)passport;
//注销失败
- (void)sessionLogoutFailed:(PSPassport *)passport error:(NSError *)error;
//获取验证码成功
- (void)sessionGetAuthCodeSuccessful:(PSPassport *)passport nextAuthCodeSeconds:(NSInteger)seconds seq:(NSString *)seq;
//获取验证码失败
- (void)sessionGetAuthCodeFailed:(PSPassport *)passport error:(NSError *)error;
//短信验证成功
- (void)sessionAuthSuccessful:(PSPassport *)passport;
//短信验证失败
- (void)sessionAuthFailed:(PSPassport *)passport error:(NSError *)error;
//请求授权验证
- (void)sessionRequestAuthorizationSuccessful:(PSPassport *)passport;
//请求授权验证失败
- (void)sessionRequestAuthorizationFailed:(PSPassport *)passport error:(NSError *)error;
//注册用户信息成功
- (void)sessionRegisterUserInfoSuccessful:(PSPassport *)passport;
//注册用户信息失败
- (void)sessionRegisterUserInfoFailed:(PSPassport *)passport error:(NSError *)error;
//第三方登录 绑定手机号成功
- (void)sessionBundMobileSuccessful:(PSPassport *)passport;
//第三方登录 绑定手机号失败
- (void)sessionBundMobileFailed:(PSPassport *)passport error:(NSError *)error;
//第三方直接登录成功
- (void)sessionSynchroInfoSuccessful:(PSPassport *)passport;
//第三方直接登录失败
- (void)sessionSynchorInfoFailed:(PSPassport *)passport error:(NSError *)error;
@end

@interface PSSession : NSObject

@property (nonatomic, weak) id<PSSessionDelegate> delegate;
@property (nonatomic, strong, readonly) PSPassport *passport;
@property (nonatomic, assign) BOOL isLogin;

+ (PSSession *)sharedInstance;
- (void)doLoginWithPassport:(PSPassport *)passport;
- (void)doRegisterWithPassport:(PSPassport *)passport;
- (void)getAuthCodeWithPassport:(PSPassport *)passport;
- (void)doLogout;
- (void)doBundMobileWithPassport:(PSPassport *)passport;
- (void)synchorInfoWithPassport:(PSPassport *)passport;
@end
