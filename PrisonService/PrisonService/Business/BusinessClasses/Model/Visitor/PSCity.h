//
//  PSCity.h
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"
#import "PSJail.h"

@protocol PSCity
@end

@interface PSCity : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *provicesId;
@property (nonatomic, strong) NSArray<PSJail,Optional> *jails;

@end
