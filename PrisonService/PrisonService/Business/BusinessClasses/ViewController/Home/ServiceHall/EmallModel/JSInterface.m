//
//  JSInterface.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/30.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSInterface.h"
#import <AlipaySDK/AlipaySDK.h>
#import "PSBusinessConstants.h"
#import "WXApi.h"
#import "PSAlertView.h"
#import "PSSessionManager.h"
@implementation JSInterface


-(void)aliPay:(NSString*)orderInfo{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[AlipaySDK defaultService] payOrder:orderInfo fromScheme:AppScheme callback:^(NSDictionary *resultDic) {
        }];
    });

}

-(void)wxPay:(NSString*)json{

   NSDictionary*dic= [self convertjsonStringToDict:json ];
   PayReq *request = [[PayReq alloc] init];
   request.partnerId = dic[@"merchantId"];
   request.prepayId = dic[@"prepayId"];
   request.package = @"Sign=WXPay";
   request.nonceStr = dic[@"nonce"];
   request.timeStamp = [dic[@"timestamp"]intValue];
   request.sign = dic[@"sign"];
   [WXApi sendReq:request];
}



-(void)tokenTimeLimit{
    [PSAlertView showWithTitle:nil message:@"您的身份已过期,请重新使用正确的验证码进行登录" messageAlignment:NSTextAlignmentCenter image:nil handler:^(PSAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [[PSSessionManager sharedInstance] doLogout];
        }

    } buttonTitles:@"确定", nil];
}


//json字符串转字典
- (NSDictionary *)convertjsonStringToDict:(NSString *)jsonString{
    NSDictionary *retDict = nil;
    if ([jsonString isKindOfClass:[NSString class]]) {
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        retDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        return  retDict;
    }else{
        return retDict;
    }

}




@end
