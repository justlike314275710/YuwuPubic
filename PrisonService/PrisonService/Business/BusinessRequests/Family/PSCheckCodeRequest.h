//
//  PSCheckCodeRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyBaseRequest.h"
#import "PSCheckCodeResponse.h"

@interface PSCheckCodeRequest : PSFamilyBaseRequest

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *code;

@end
