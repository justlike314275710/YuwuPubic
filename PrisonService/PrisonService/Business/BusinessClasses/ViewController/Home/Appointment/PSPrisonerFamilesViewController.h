//
//  PSPrisonerFamilesViewController.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
typedef void (^ReturnValueBlock) (NSArray *arrayValue);
typedef void(^addFamilesCompletion)(BOOL successful);
@interface PSPrisonerFamilesViewController : PSBusinessViewController
@property(nonatomic, copy) ReturnValueBlock returnValueBlock;
@property (nonatomic, copy) addFamilesCompletion completion;
@end
