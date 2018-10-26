//
//  PSAlipayResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSAlipayInfo.h"

@interface PSAlipayResponse : PSResponse

@property (nonatomic, strong) PSAlipayInfo<Optional> *data;

@end
