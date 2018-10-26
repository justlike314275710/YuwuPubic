//
//  PSAlipayRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"
#import "PSAlipayResponse.h"

@interface PSAlipayRequest : PSBusinessRequest

@property (nonatomic, strong) NSString *jailId;
@property (nonatomic, strong) NSString *familyId;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, assign) CGFloat amount;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) NSString *itemId;

@end
