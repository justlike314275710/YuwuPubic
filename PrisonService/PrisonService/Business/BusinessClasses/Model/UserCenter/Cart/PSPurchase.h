//
//  PSPurchase.h
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@protocol PSPurchase<NSObject>
@end

@interface PSPurchase : JSONModel

@property (nonatomic, assign) CGFloat amount;
@property (nonatomic, assign) NSInteger quantity;
@property (nonatomic, strong) NSString<Optional> *paymentType;
@property (nonatomic, strong) NSString<Optional> *tradeNo;
@property (nonatomic, strong) NSString<Optional> *gmtPayment;

@end
