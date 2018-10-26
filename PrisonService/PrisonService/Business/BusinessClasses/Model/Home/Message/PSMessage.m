//
//  PSMessage.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMessage.h"

@implementation PSMessage

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"type"]) return YES;
    if ([propertyName isEqualToString:@"contentSize"]) return YES;
    return NO;
}

@end
