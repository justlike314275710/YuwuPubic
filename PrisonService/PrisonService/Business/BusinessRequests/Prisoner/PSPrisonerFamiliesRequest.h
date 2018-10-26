//
//  PSPrisonerFamiliesRequest.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"
#import "PSPrisonerFamiliesResponse.h"
@interface PSPrisonerFamiliesRequest : PSBusinessRequest
@property (nonatomic , strong) NSString *prisonerId;
@end
