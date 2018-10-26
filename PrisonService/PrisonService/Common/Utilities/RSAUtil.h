//
//  RSAUtil.h
//  Start
//
//  Created by Glen on 16/7/14.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *RSA_PublicKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCiXFAlHkkVZPPT5Kl/d7rXK3sXbGe3Rx8+gI1LWDWvf/33jJfYNB38A2nY6Kh06w3APxBXIblj+lvWNpQzavB3G6Wr03hSb8x+h0v3jkNQKyVwbnnEvJh0Dw4oy+WVfzjJYcETEOaK2b+/A9f3PjIAk1KKDV/3/30rjJp0cYrDHQIDAQAB";

@interface RSAUtil : NSObject
/**
 *  RSA加密算法
 *
 *  @param str    加密明文
 *  @param pubKey 公钥
 *
 *  @return <#return value description#>
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

/**
 *  RSA解密算法
 */
//公钥解密
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
//私钥解密
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;
@end
