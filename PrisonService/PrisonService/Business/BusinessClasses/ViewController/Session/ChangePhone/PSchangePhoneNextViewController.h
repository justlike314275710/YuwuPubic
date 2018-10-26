//
//  PSchangePhoneNextViewController.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
@class PSchangPhoneViewController;
@interface PSchangePhoneNextViewController : PSBusinessViewController
@property (nonatomic,strong) NSString*oldPhone;
@property (nonatomic,strong) NSString*oldPhoneCode;
@property (nonatomic,strong) NSString*uuid;
@property (nonatomic,strong) PSchangPhoneViewController*changephoneVC;
@end
