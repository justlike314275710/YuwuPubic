//
//  PSPrisonerDetailRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"
#import "PSPrisonerDetailResponse.h"

@interface PSPrisonerDetailRequest : PSBusinessRequest

@property (nonatomic, strong) NSString *prisonerId;

@end
