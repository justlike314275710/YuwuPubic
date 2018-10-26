//
//  PSSettingViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/11.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSSettingViewModel.h"

@implementation PSSettingViewModel
- (id)init {
    self = [super init];
    if (self) {
        NSMutableArray *items = [NSMutableArray array];
        /*
        NSMutableArray *firstSectionItems = [NSMutableArray array];
        PSSettingItem *alarmItem = [PSSettingItem new];
        alarmItem.itemName = @"闹钟提醒";
        alarmItem.itemIconName = @"userCenterSettingAlarm";
        [firstSectionItems addObject:alarmItem];
        
        PSSettingItem *passwordItem = [PSSettingItem new];
        passwordItem.itemName = @"独立密码设置";
        passwordItem.itemIconName = @"userCenterSettingPassword";
        [firstSectionItems addObject:passwordItem];
        
        [items addObject:firstSectionItems];
         */
        
        NSMutableArray *secondSectionItems = [NSMutableArray array];
        PSSettingItem *feedbackItem = [PSSettingItem new];
        NSString*feedback=NSLocalizedString(@"feedback", @"意见反馈");
        feedbackItem.itemName = feedback;
        feedbackItem.itemIconName = @"userCenterSettingFeedback";
        [secondSectionItems addObject:feedbackItem];
        
        [items addObject:secondSectionItems];
        
        self.settingItems = items;
    }
    return self;
}

@end
