//
//  PSAccountNumber.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol PSAccountNumber <NSObject>
@end
@interface PSAccountNumber : JSONModel
@property (nonatomic, strong) NSString<Optional> *phone;
@property (nonatomic, strong) NSString<Optional> *accessToken;
@property (nonatomic, strong) NSString<Optional> *uuid;

@end
