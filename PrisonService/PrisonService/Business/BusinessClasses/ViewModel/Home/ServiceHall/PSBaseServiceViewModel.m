//
//  PSBaseServiceViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseServiceViewModel.h"

@implementation PSBaseServiceViewModel

- (id)init {
    self = [super init];
    if (self) {
        _page = 1;
        _pageSize = 10;
    }
    return self;
}

@end
