//
//  PSPrisonerFamiliesResponse.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSPrisonerFamily.h"
@interface PSPrisonerFamiliesResponse : PSResponse
@property (nonatomic , strong) NSArray<PSPrisonerFamily,Optional> *prisonerFamilies;
@end
