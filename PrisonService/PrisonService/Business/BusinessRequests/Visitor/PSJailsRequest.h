//
//  PSJailsRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorBaseRequest.h"
#import "PSJailsResponse.h"

@interface PSJailsRequest : PSVisitorBaseRequest

@property (nonatomic, strong) NSString *provinces;
@property (nonatomic, strong) NSString *citys;
@property (nonatomic ,strong) NSString *language;

@end
