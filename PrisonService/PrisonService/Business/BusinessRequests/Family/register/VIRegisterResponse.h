//
//  VIRegisterResponse.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/8/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSUserSession.h"
@interface VIRegisterResponse : PSResponse

@property (nonatomic, strong) PSUserSession *data;
@end
