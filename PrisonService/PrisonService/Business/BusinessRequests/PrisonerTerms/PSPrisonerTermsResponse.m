//
//  PSPrisonerTermsResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/26.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonerTermsResponse.h"

@implementation PSPrisonerTermsResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"periods":@"data.prisonTerms"}];
}

@end
