//
//  PSJailConfigurationsRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorBaseRequest.h"
#import "PSJailConfigurationsResponse.h"

@interface PSJailConfigurationsRequest : PSVisitorBaseRequest

@property (nonatomic, strong) NSString *jailId;

@end
