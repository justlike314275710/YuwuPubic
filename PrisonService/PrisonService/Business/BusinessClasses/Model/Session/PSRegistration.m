//
//  PSRegistration.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRegistration.h"

@implementation PSRegistration
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.jailId = [aDecoder decodeObjectForKey:@"jailId"];
        self.prisonerId = [aDecoder decodeObjectForKey:@"prisonerId"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.prisonerNumber = [aDecoder decodeObjectForKey:@"prisonerNumber"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.jailId forKey:@"jailId"];
    [aCoder encodeObject:self.prisonerId forKey:@"prisonerId"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.prisonerNumber forKey:@"prisonerNumber"];
    [aCoder encodeObject:self.status forKey:@"status"];
}

@end
