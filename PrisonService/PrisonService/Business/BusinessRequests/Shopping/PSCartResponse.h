//
//  PSShoppingResponse.h
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSPurchase.h"

@interface PSCartResponse : PSResponse

@property (nonatomic, strong) NSArray<PSPurchase,Optional> *purchases;

@end
