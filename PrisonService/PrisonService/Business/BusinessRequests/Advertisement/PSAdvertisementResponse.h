//
//  PSAdvertisementResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSAdvertisement.h"

@interface PSAdvertisementResponse : PSResponse

@property (nonatomic, strong) NSArray<PSAdvertisement,Optional> *advertisements;

@end
