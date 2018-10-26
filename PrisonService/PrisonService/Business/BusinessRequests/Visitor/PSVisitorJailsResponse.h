//
//  PSVisitorJailsResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSProvince.h"

@interface PSVisitorJailsResponse : PSResponse

@property (nonatomic, strong) NSArray<PSProvince> *provinces;

@end
