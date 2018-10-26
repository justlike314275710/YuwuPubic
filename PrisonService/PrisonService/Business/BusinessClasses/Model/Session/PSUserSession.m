//
//  PSUserSession.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUserSession.h"

@implementation PSUserSession
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.token = [aDecoder decodeObjectForKey:@"token"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.token forKey:@"token"];
    [super encodeWithCoder:aCoder];
}

@end
