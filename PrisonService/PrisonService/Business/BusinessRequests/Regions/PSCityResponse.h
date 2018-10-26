//
//  PSCityResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSCity.h"

@interface PSCityResponse : PSResponse

@property (nonatomic, strong) NSArray<PSCity> *citys;

@end
