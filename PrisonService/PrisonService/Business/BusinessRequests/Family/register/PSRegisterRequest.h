//
//  PSRegisterRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyBaseRequest.h"
#import "PSRegisterResponse.h"

@interface PSRegisterRequest : PSFamilyBaseRequest

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *jailId;
@property (nonatomic, strong) NSString *prisonerNumber;
@property (nonatomic, strong) NSString *relationship;//家属关系
@property (nonatomic, strong) NSString *relationUrl;//家属关系图
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *idCardFront;
@property (nonatomic, strong) NSString *idCardBack;
@property (nonatomic, strong) NSString *type;

@end
