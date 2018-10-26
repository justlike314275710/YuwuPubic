//
//  PSMeettingHistory.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeettingHistory.h"

@implementation PSMeettingHistory
+(JSONKeyMapper *)keyMapper{
  return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"historyId"}];
   // return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"id":@"historyId"}];
}
@end
