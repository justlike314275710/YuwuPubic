//
//  PSPrisonerDetail.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonerDetail.h"

@implementation PSPrisonerDetail

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return [propertyName isEqualToString:@"times"];
}

@end
