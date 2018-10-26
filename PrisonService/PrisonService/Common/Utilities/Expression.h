//
//  Expression.h
//  Yuwu
//
//  Created by wax on 16/3/4.
//  Copyright © 2016年 sinog2c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Expression : NSObject

+(BOOL)validateName:(NSString *)text;//判断输入的名字是否合法
+(BOOL)validatePhoneId:(NSString *)text;//判断输入的电话号码是否合法
+(BOOL)validateRelation:(NSString *)text;//判断输入的关系是否为合法
+(BOOL)validatePrisonId:(NSString *)text;//判断输入的囚号是否为合法
+(BOOL)validatePrison:(NSString *)text;//判断输入的监狱是否为合法
+(BOOL)validateVetifyCode:(NSString *)text;//判断输入的验证码是否为合法
+(BOOL)validateIDCard:(NSString *)value;//判断输入的身份证是否为合法

@end
