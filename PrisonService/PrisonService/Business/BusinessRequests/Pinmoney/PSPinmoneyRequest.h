//
//  PSPinmoneyRequest.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"

@interface PSPinmoneyRequest : PSBusinessRequest
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;
@property (nonatomic, strong) NSString *prisonerId;
@end
