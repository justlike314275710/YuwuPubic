//
//  PSprisonerFamily.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol PSPrisonerFamily
@end
@interface PSPrisonerFamily : JSONModel
@property (nonatomic, strong) NSString<Optional> *jailId;
@property (nonatomic ,strong) NSString<Optional> *familyId;
@property (nonatomic, strong) NSString<Optional> *prisonerId;
@property (nonatomic, strong) NSString<Optional> *familyName;
@property (nonatomic, strong) NSString<Optional> *familyPhone;
@property (nonatomic, strong) NSString<Optional> *familyUuid;
@property (nonatomic, strong) NSString<Optional> *relationship;
@property (nonatomic, strong) NSString<Optional> *familyAvatarUrl;
@property (nonatomic, strong) NSString<Optional> *familyIdCardFront;
@property (nonatomic, strong) NSString<Optional> *familyIdCardBack;
@end
