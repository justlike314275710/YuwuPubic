//
//  PSPassport.h
//  Common
//
//  Created by calvin on 14-4-23.
//  Copyright (c) 2014年 BuBuGao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PSPassportType) {
    PSPassportPhone,     //手机号登录
};

@class PSPassport;

@protocol PSPassportDelegate <NSObject>

//登录成功
- (void)passportLoginSuccessful:(PSPassport *)passport;
//登录失败
- (void)passportLoginFailed:(PSPassport *)passport error:(NSError *)error;
//需要图形验证码验证
- (void)passportNeedVerificationCode:(PSPassport *)passport error:(NSError *)error;
//图形验证码成功
- (void)passportNeedVerificationCodeSuccess:(PSPassport *)passport;
//注销成功
- (void)passportLogoutSuccessful:(PSPassport *)passport;
//注销失败
- (void)passportLogoutFailed:(PSPassport *)passport error:(NSError *)error;
//获取验证码成功
- (void)passportGetAuthCodeSuccessful:(PSPassport *)passport nextAuthCodeSeconds:(NSInteger)seconds seq:(NSString *)seq;
//获取验证码失败
- (void)passportGetAuthCodeFailed:(PSPassport *)passport error:(NSError *)error;
//短信验证成功
- (void)passportAuthSuccessful:(PSPassport *)passport;
//短信验证失败
- (void)passportAuthFailed:(PSPassport *)passport error:(NSError *)error;
//请求授权验证
- (void)passportRequestAuthorizationSuccessful:(PSPassport *)passport;
//请求授权验证失败
- (void)passportRequestAuthorizationFailed:(PSPassport *)passport error:(NSError *)error;
//注册用户信息成功
- (void)passportRegisterUserInfoSuccessful:(PSPassport *)passport;
//注册用户信息失败
- (void)passportRegisterUserInfoFailed:(PSPassport *)passport error:(NSError *)error;
//第三方登录 绑定手机号成功
- (void)passportBundMobileSuccessful:(PSPassport *)passport;
//第三方登录 绑定手机号失败
- (void)passportBundMobileFailed:(PSPassport *)passport error:(NSError *)error;
//第三方直接登录成功
- (void)passportSynchorInfoSuccessful:(PSPassport *)passport;
//第三方直接登录失败
- (void)passportSynchorInfoFailed:(PSPassport *)passport error:(NSError *)error;

@end

@interface PSPassport : NSObject <NSCoding>

/*!
 * 登录帐号
 */
@property (nonatomic, strong, readonly) NSString *loginID;
/**
 *  会员类型
 */
@property (nonatomic, assign, readonly) PSPassportType type;
/*!
 * usertoken
 */
@property (nonatomic, strong, readonly) NSString *usertoken;
/*!
 * 云信登录ID
 */
@property (nonatomic, strong, readonly) NSString *imId;
/*!
 * 云信登录token(加密的)
 */
@property (nonatomic, strong, readonly) NSString *imToken;
/*!
 * 云信登录token(解密的)
 */
@property (nonatomic, strong) NSString *decryptedImToken;
/*!
 * 是否新用户
 */
@property (nonatomic, assign, readonly) BOOL newUser;

/*!
 * delegate
 */
@property (nonatomic, weak) id<PSPassportDelegate> delegate;

//登录
- (void)doLogin;
//获取短信验证码
- (void)getAuthCode;
//短信验证
- (void)doVerify;
//注册
- (void)doRegister;
//注销
- (void)doLogout;
//注册用户信息
- (void)doRegisterUserInfo;
//绑定手机号
- (void)doBundMobile;
//同步三方用户信息
- (void)synchorInfo;

@end
