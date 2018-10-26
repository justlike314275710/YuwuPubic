//
//  PSMeetHistoryResponse.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSMeettingHistory.h"
@interface PSMeetHistoryResponse : PSResponse
@property (nonatomic, strong) NSArray<PSMeettingHistory,Optional> *history;
@end
