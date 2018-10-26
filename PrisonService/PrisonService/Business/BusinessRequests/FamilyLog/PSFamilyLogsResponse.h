//
//  PSFamilyLogsResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSMessage.h"

@interface PSFamilyLogsResponse : PSResponse

@property (nonatomic, strong) NSArray<PSMessage,Optional> *logs;

@end
