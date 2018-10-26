//
//  NSString+Encryption.h
//  Common
//
//  Created by calvin on 14-4-2.
//  Copyright (c) 2014年 BuBuGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (Encryption)

- (NSString *)md5String;
- (NSString *)DESEncryptWithKey:(NSString *)key;
- (NSString *)DESDecryptWithKey:(NSString *)key;
- (NSString *)encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key;

@end
