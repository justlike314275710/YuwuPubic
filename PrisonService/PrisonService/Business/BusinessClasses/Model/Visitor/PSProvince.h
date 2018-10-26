//
//  PSProvince.h
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"
#import "PSCity.h"

@protocol PSProvince
@end

@interface PSProvince : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<PSCity,Optional> *citys;

@end
