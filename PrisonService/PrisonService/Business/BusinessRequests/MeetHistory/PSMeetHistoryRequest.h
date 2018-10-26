//
//  PSMeetHistoryRequest.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRequest.h"
#import "PSBusinessRequest.h"
@interface PSMeetHistoryRequest : PSBusinessRequest
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;
@property (nonatomic, strong) NSString *familyId;
@end
