//
//  PSUserCenterViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/11.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUserCenterViewModel.h"

@implementation PSUserCenterViewModel
- (id)init {
    self = [super init];
    if (self) {
        NSMutableArray *items = [NSMutableArray array];
        
        NSString*userCenterAccount=NSLocalizedString(@"userCenterAccount", @"账号信息");
        PSUserCenterItem *accountItem = [PSUserCenterItem new];
        accountItem.itemName = userCenterAccount;
        accountItem.itemIconName = @"userCenterAccountIcon";
        accountItem.itemType = PSUserCenterAccount;
        [items addObject:accountItem];
        
        NSString*userCenterHistory=NSLocalizedString(@"userCenterHistory", @"会见历史");
        PSUserCenterItem *historyItem = [PSUserCenterItem new];
        historyItem.itemName = userCenterHistory;
        historyItem.itemIconName = @"userCenterHistory";
        historyItem.itemType = PSUserCenterHistory;
        [items addObject:historyItem];
       
        NSString*userCenterCart=NSLocalizedString(@"userCenterCart", @"购物记录");
        PSUserCenterItem *cartItem = [PSUserCenterItem new];
        cartItem.itemName = userCenterCart;
        cartItem.itemIconName = @"userCenterCartIcon";
        cartItem.itemType = PSUserCenterCart;
        [items addObject:cartItem];
        
        NSString*userCenterSetting=NSLocalizedString(@"userCenterSetting", @"设置");
        PSUserCenterItem *settingItem = [PSUserCenterItem new];
        settingItem.itemName = userCenterSetting;
        settingItem.itemIconName = @"userCenterSettingIcon";
        settingItem.itemType = PSUserCenterSetting;
        [items addObject:settingItem];
        
        NSString*userCenterBalance=NSLocalizedString(@"userCenterBalance", @"我的余额");
        PSUserCenterItem *balanceItem = [PSUserCenterItem new];
        balanceItem.itemName = userCenterBalance;
        balanceItem.itemIconName = @"userCenterBalanceIcon";
        balanceItem.itemType = PSUserCenterBalance;
        [items addObject:balanceItem];
        
        NSString*userCenterAccreditation=NSLocalizedString(@"userCenterAccreditation", @"家属认证");
        PSUserCenterItem *AuthenticationItem = [PSUserCenterItem new];
        AuthenticationItem.itemName = userCenterAccreditation;
        AuthenticationItem.itemIconName = @"userCenterAccountAuthentication";
        AuthenticationItem.itemType = PSUserCenterAuthentication;
        [items addObject:AuthenticationItem];
        
        NSString*userCenterAddFamily=NSLocalizedString(@"userCenterAddFamily", @"增加家属");
        PSUserCenterItem *addFamiliesItem = [PSUserCenterItem new];
        addFamiliesItem.itemName = userCenterAddFamily;
        addFamiliesItem.itemIconName = @"userCenterAccountAdd";
        addFamiliesItem.itemType = PSUserCenterAddFamilies;
        [items addObject:addFamiliesItem];

        
        NSString*userCenterLogout=NSLocalizedString(@"userCenterLogout", @"退出帐号");
        PSUserCenterItem *logoutItem = [PSUserCenterItem new];
        logoutItem.itemName = userCenterLogout;
        logoutItem.itemIconName = @"userCenterLogoutIcon";
        logoutItem.itemType = PSUserCenterLogout;
        [items addObject:logoutItem];
        
        _items = items;
    }
    return self;
}

@end
