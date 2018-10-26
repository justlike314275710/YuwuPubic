//
//  PSNewsResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSNews.h"

@interface PSNewsResponse : PSResponse

@property (nonatomic, strong) NSArray<PSNews,Optional> *news;

@end
