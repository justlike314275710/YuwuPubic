//
//  PSProvinceResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSProvince.h"

@interface PSProvinceResponse : PSResponse

@property (nonatomic, strong) NSArray<PSProvince> *provinces;

@end
