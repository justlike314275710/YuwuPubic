//
//  PSWhiteListRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/28.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"
#import "PSWhiteListResponse.h"

@interface PSWhiteListRequest : PSBusinessRequest

@property (nonatomic, strong) NSString *phone;

@end
