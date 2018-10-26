//
//  PSVisitorHandler.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSJail.h"

typedef void(^VisitorHandler)(PSJail *selectedJail);

@protocol PSVisitorHandler <NSObject>

- (void)setCallback:(VisitorHandler)callback;
- (void)initialize;

@end
