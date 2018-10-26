//
//  PSBindPrisonerRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyBaseRequest.h"
#import "PSBindPrisonerResponse.h"

@interface PSBindPrisonerRequest : PSFamilyBaseRequest

@property (nonatomic, strong) NSString *jailId;
@property (nonatomic, strong) NSString *familyId;
@property (nonatomic, strong) NSString *relationship;
@property (nonatomic, strong) NSString *prisonerNumber;
@property (nonatomic ,strong) NSString*relationalProofUrl;
@end
