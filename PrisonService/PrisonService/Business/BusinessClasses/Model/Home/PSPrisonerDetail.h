//
//  PSPrisonerDetail.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@interface PSPrisonerDetail : JSONModel

@property (nonatomic, strong) NSString<Optional> *originalSentence;
@property (nonatomic, strong) NSString<Optional> *gender;
@property (nonatomic, strong) NSString<Optional> *crimes;
@property (nonatomic, strong) NSString<Optional> *prisonerNumber;
@property (nonatomic, strong) NSString<Optional> *prisonerId;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *startedAt;
@property (nonatomic, strong) NSString<Optional> *endedAt;
@property (nonatomic, strong) NSString<Optional> *termStart;
@property (nonatomic, strong) NSString<Optional> *termFinish;
@property (nonatomic, strong) NSString<Optional> *jailName;
@property (nonatomic, strong) NSString<Optional> *jailId;
@property (nonatomic, strong) NSString<Optional> *sentenceDesc;
@property (nonatomic, strong) NSString<Optional> *additionalPunishment;
@property (nonatomic, strong) NSString<Optional> *updated_at;
@property (nonatomic, assign) NSInteger times;

@end
