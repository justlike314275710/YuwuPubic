//
//  JSInterface.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/30.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "PSPaymentBlock.h"
@protocol JSInterfaceProtocol <JSExport>
-(void)aliPay:(NSString*)orderInfo;
-(void)wxPay:(NSString*)json;
-(void)tokenTimeLimit;

@end
@interface JSInterface : NSObject<JSInterfaceProtocol>
@property (nonatomic, copy) PaymentGoPay goPay;


@end
