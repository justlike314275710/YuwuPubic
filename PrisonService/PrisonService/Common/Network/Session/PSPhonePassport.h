//
//  PSPhonePassport.h
//  Start
//  手机号登录
//  Created by Glen on 16/6/23.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import "PSPassport.h"

@interface PSPhonePassport : PSPassport
/**
 *  获取短信验证码 初始化
 *
 *  @param phone 手机号码
 *
 */
- (id)initWithPhoneNum:(NSString *)phone;

/*!
 * 登录初始化
 * @param loginID 登录帐号
 * @param smsCode 登录密码
 */
- (id)initWithLoginID:(NSString *)loginID smsCode:(NSString *)smsCode;

@end
