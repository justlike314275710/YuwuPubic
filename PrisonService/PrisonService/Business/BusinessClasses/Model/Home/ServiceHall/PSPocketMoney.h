//
//  PSPocketMoney.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol PSPocketMoney<NSObject>
@end

@interface PSPocketMoney : JSONModel
@property (nonatomic, strong) NSString<Optional> *income;
@property (nonatomic, strong) NSString<Optional> *expenditure;
@property (nonatomic, strong) NSString<Optional> *createdAt;
@property (nonatomic, strong) NSString<Optional> *accountDate;
@property (nonatomic, strong) NSString<Optional> *balance;
@property (nonatomic, strong) NSString<Optional> *prisonerNumber;
@property (nonatomic, strong) NSString<Optional> *name;
@end
