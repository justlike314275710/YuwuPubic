//
//  PSCityRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRegionsBaseRequest.h"
#import "PSCityResponse.h"

@interface PSCityRequest : PSRegionsBaseRequest

@property (nonatomic, strong) NSString *provicesId;
@property (nonatomic , strong) NSString *language;
@end
