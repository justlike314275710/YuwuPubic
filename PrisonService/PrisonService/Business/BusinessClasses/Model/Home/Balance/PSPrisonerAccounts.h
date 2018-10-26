//
//  PSPrisonerAccounts.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/5/30.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Accounts.h"
@interface PSPrisonerAccounts : JSONModel
@property (nonatomic, strong) NSArray<Accounts *> *accounts;
@end
