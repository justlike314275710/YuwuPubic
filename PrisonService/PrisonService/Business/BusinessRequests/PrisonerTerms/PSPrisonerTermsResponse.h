//
//  PSPrisonerTermsResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/26.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSPeriodChange.h"

@interface PSPrisonerTermsResponse : PSResponse

@property (nonatomic, strong) NSArray<PSPeriodChange,Optional> *periods;

@end
