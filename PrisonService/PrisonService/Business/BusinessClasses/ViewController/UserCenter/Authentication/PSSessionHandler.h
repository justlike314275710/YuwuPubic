//
//  PSSessionHandler.h
//  PrisonService
//
//  Created by calvin on 2018/4/9.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SessionHandlerCallback)(BOOL successful, id session);

@protocol PSSessionHandler <NSObject>

- (void)initialize;
- (void)setCallback:(SessionHandlerCallback)callback;

@end
