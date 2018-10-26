//
//  PSPayManager.h
//  Start
//
//  Created by calvin on 16/7/12.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSPayHandler.h"
#import "PSPayInfo.h"

@interface PSPayCenter : NSObject

+ (PSPayCenter *)payCenter;

@property (nonatomic, copy) PSPayCallback payCallback;

- (void)goPayWithPayInfo:(PSPayInfo *)payInfo callback:(PSPayCallback)callback;
- (void)handleWeChatURL:(NSURL *)url;
- (void)handleAliURL:(NSURL *)url;



@end
