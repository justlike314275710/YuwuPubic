//
//  PSApiSign.h
//  Start
//
//  Created by calvin on 17/1/9.
//  Copyright © 2017年 DingSNS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSApiSign : NSObject

@property (nonatomic, strong, readonly) NSDictionary *publicParameters;
@property (nonatomic, strong, readonly) NSDictionary *publicAndTokenParameters;

- (NSString *)signGetMethodWithParameters:(NSDictionary *)parameters;
- (NSString *)signPostMethodWithParameters:(NSDictionary *)parameters;

@end
