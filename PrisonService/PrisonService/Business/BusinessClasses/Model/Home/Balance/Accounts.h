//
//  Accounts.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/5/30.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol Accounts <NSObject>
@end
@interface Accounts : JSONModel
@property (nonatomic, strong) NSString<Optional> *id;
@property (nonatomic, strong) NSString<Optional> *familyId;
@property (nonatomic, strong) NSString<Optional> *balance;
@property (nonatomic, strong) NSString<Optional> *jailId;
@end
