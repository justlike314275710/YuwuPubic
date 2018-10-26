//
//  PSPinmoney.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//
#import "PSPocketMoney.h"
#import <JSONModel/JSONModel.h>

@interface PSPinmoney : JSONModel
@property (nonatomic, strong) NSString<Optional> *total;
@property (nonatomic, strong) NSString<Optional> *applicationDate;
@property (nonatomic, strong) NSArray<PSPocketMoney>* pocketMoney;;

@end

