//
//  PSShoppingRequest.h
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"
#import "PSCartResponse.h"

@interface PSCartRequest : PSBusinessRequest

@property (nonatomic, strong) NSString *familyId;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;

@end
