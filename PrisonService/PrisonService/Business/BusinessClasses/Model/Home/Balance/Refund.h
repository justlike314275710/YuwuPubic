//
//  Refund.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/5.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Refund : JSONModel
@property (nonatomic, strong) NSString<Optional> *msg;
@property (nonatomic, assign)  int code;
@property (nonatomic, strong) NSString<Optional> *data;
@end
