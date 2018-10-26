//
//  PSPurchase.m
//  PrisonService
//
//  Created by calvin on 2018/5/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPurchase.h"

@implementation PSPurchase
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"amount"]) return YES;
    if ([propertyName isEqualToString:@"quantity"]) return YES;
    return NO;
}

@end
