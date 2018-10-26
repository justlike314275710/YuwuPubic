//
//  PSDefaultJailResponse.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/10/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"

@interface PSDefaultJailResponse : PSResponse
@property (nonatomic, strong) NSString<Optional> *jailId;
@property (nonatomic, strong) NSString<Optional> *jailName;
@end
