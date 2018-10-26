//
//  PSAdvertisementRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"
#import "PSAdvertisementResponse.h"

typedef NS_ENUM(NSInteger, PSAdvType) {
    PSAdvLaunch = 1,
    PSAdvApp = 2
};

@interface PSAdvertisementRequest : PSBusinessRequest

@property (nonatomic, assign) PSAdvType type;
@property (nonatomic, strong) NSString *province;

@end
