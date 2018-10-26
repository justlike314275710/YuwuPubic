//
//  PSLoginResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSUserSession.h"

@interface PSLoginResponse : PSResponse

@property (nonatomic, strong) PSUserSession *data;

@end
