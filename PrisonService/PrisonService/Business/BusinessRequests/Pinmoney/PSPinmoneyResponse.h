//
//  PSPinmoneyResponse.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSPocketMoney.h"
@interface PSPinmoneyResponse : PSResponse
@property (nonatomic, strong) NSArray<PSPocketMoney,Optional> *pocketMoney;
@end
