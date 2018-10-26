//
//  PSWechatPayResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSWechatInfo.h"

@interface PSWechatPayResponse : PSResponse

@property (nonatomic, strong) PSWechatInfo<Optional> *data;

@end
