//
//  PSProvinceRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRegionsBaseRequest.h"
#import "PSProvinceResponse.h"

@interface PSProvinceRequest : PSRegionsBaseRequest
@property (nonatomic , strong) NSString *language;
@end
