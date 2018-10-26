//
//  PSUserCenterItem.h
//  PrisonService
//
//  Created by calvin on 2018/4/11.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFunctionItem.h"

typedef NS_ENUM(NSUInteger, PSUserCenterItemType) {
    PSUserCenterAccount = 0,
    PSUserCenterHistory,
    PSUserCenterCart,
    PSUserCenterSetting,
    PSUserCenterBalance,
    PSUserCenterLogout,
    PSUserCenterAuthentication,
    PSUserCenterAddFamilies
    
};

@interface PSUserCenterItem : PSFunctionItem

@property (nonatomic, assign) PSUserCenterItemType itemType;

@end
