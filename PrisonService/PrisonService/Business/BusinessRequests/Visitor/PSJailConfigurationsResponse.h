//
//  PSJailConfigurationsResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSJailConfiguration.h"

@interface PSJailConfigurationsResponse : PSResponse

@property (nonatomic, strong) NSString<Optional> *settings;
@property (nonatomic, strong) NSString<Optional> *jailName;
@property (nonatomic, strong) PSJailConfiguration<Optional,Ignore> *configuration;

@end
