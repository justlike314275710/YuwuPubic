//
//  PSJail.m
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSJail.h"

@implementation PSJail
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.title forKey:@"title"];
}

//+ (JSONKeyMapper *)keyMapper {
//    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"profile":@"description"}];
//}

@end
