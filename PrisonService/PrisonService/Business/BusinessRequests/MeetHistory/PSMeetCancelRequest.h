//
//  PSMeetCancelRequest.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/8/3.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessRequest.h"

@interface PSMeetCancelRequest : PSBusinessRequest
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *cause;

@end
