//
//  PSFamilyServiceViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyServiceViewModel.h"
#import "NSString+Date.h"
#import "NSDate+Components.h"
#import "PSSessionManager.h"

@implementation PSFamilyServiceViewModel
- (id)init {
    self = [super init];
    if (self) {
        
//        PSPrisonerDetail *prisonerDetail = nil;
//        NSInteger index = [PSSessionManager sharedInstance].selectedPrisonerIndex;
//        NSArray *details = [PSSessionManager sharedInstance].passedPrisonerDetails;
//        if (index >= 0 && index < details.count) {
//            prisonerDetail = details[index];
//        }
        NSString*sentence=NSLocalizedString(@"sentence", @"原判刑期");
        NSMutableArray *items = [NSMutableArray array];
        PSFamilyServiceItem *periodItem = [PSFamilyServiceItem new];
        periodItem.itemIconName = @"serviceHallPeriodIcon";
        periodItem.itemName = sentence;
        periodItem.content = self.prisonerDetail.originalSentence;
        [items addObject:periodItem];
        
//        PSFamilyServiceItem *guiltyNametem = [PSFamilyServiceItem new];
//        guiltyNametem.itemIconName = @"serviceHallGuiltyIcon";
//        guiltyNametem.itemName = @"罪名";
//        guiltyNametem.content = self.prisonerDetail.crimes;
//        [items addObject:guiltyNametem];
        
        NSString*sentence_start=NSLocalizedString(@"sentence_start", @"原判刑期起日");
        PSFamilyServiceItem *startItem = [PSFamilyServiceItem new];
        startItem.itemIconName = @"serviceHallStartIcon";
        startItem.itemName =sentence_start;
        startItem.content = [self.prisonerDetail.startedAt timestampToDateString];
        [items addObject:startItem];
        
        NSString*sentence_end=NSLocalizedString(@"sentence_end", @"原判刑期止日");
        PSFamilyServiceItem *endItem = [PSFamilyServiceItem new];
        endItem.itemIconName = @"serviceHallEndIcon";
        endItem.itemName = sentence_end;
        endItem.content = [self.prisonerDetail.endedAt timestampToDateString];
        [items addObject:endItem];
        
//        PSFamilyServiceItem *extraItem = [PSFamilyServiceItem new];
//        extraItem.itemIconName = @"serviceHallExtraIcon";
//        extraItem.itemName = @"附加刑";
//        extraItem.content = self.prisonerDetail.additionalPunishment ? self.prisonerDetail.additionalPunishment : @"无";
//        [items addObject:extraItem];
        
        NSString*Reduced_number=NSLocalizedString(@"Reduced_number", @"累计减刑次数");
        PSFamilyServiceItem *reduceItem = [PSFamilyServiceItem new];
        reduceItem.itemIconName = @"serviceHallReduceIcon";
        reduceItem.itemName = Reduced_number;
        reduceItem.content = [NSString stringWithFormat:@"%ld次",(long)self.prisonerDetail.times];
        [items addObject:reduceItem];
        
        NSString*Current_term=NSLocalizedString(@"Current_term", @"现刑期止日");
        PSFamilyServiceItem *lastReduceItem = [PSFamilyServiceItem new];
        lastReduceItem.itemIconName = @"serviceHallLastReduceIcon";
        lastReduceItem.itemName = Current_term;
        NSString * ALLtermFinishString= self.prisonerDetail.termFinish;
        NSString *termFinishString;
        if (ALLtermFinishString.length!=0) {
              termFinishString = [self.prisonerDetail.termFinish substringToIndex:10];
        } else {
             termFinishString=[self.prisonerDetail.endedAt timestampToDateString];;
        }
       
       // lastReduceItem.content =[[self.prisonerDetail.termFinish stringToDateWithFormat:@"yyyy-MM-dd HH:mm:ss.SSS"] dateStringWithFormat:@"yyyy-MM-dd"];
        lastReduceItem.content=termFinishString;
        [items addObject:lastReduceItem];
        _familyServiceItems = items;
        
        NSString*Pocket_money=NSLocalizedString(@"Pocket_money", @"零花钱情况");
        NSMutableArray *otherItems = [NSMutableArray array];
        PSFamilyServiceItem *changeItem = [PSFamilyServiceItem new];
        changeItem.itemIconName = @"serviceHallPinmoneyIcon";
        changeItem.itemName = Pocket_money;
        [otherItems addObject:changeItem];
        
        NSString*Consumption_prison=NSLocalizedString(@"Consumption_prison", @"狱内消费情况");
        PSFamilyServiceItem *honorItem = [PSFamilyServiceItem new];
        honorItem.itemIconName = @"serviceHallConsumptionIcon";
        honorItem.itemName = Consumption_prison;
        [otherItems addObject:honorItem];
        
        _otherServiceItems = otherItems;
    }
    return self;
}

@end
