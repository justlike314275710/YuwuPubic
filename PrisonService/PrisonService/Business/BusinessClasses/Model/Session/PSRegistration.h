//
//  PSRegistration.h
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@protocol PSRegistration
@end

@interface PSRegistration :JSONModel

@property (nonatomic, strong) NSString<Optional> *jailId;
//@property (nonatomic, assign) int jailId;
@property (nonatomic , strong) NSString *createdAt;
@property (nonatomic, strong) NSString<Optional> *prisonerId;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *prisonerNumber;
@property (nonatomic, strong) NSString<Optional> *status;
@property (nonatomic, strong) NSString<Optional> *relationship;
@property (nonatomic, strong) NSString<Optional> *gender;
@property (nonatomic, strong) NSString<Optional> *prisonTermStartedAt;
@property (nonatomic, strong) NSString<Optional> *prisonTermEndedAt;

@end
