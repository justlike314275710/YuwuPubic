//
//  PSPrisonerDetailResponse.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonerDetailResponse.h"

@implementation PSPrisonerDetailResponse

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"prisonerDetail":@"data.prisoners"}];
}

@end
