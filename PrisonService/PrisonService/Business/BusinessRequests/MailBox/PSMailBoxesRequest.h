//
//  PSMailBoxesRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseMailBoxRequest.h"
#import "PSMailBoxesResponse.h"

@interface PSMailBoxesRequest : PSBaseMailBoxRequest

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;
@property (nonatomic, strong) NSString *jailId;
@property (nonatomic, strong) NSString *familyId;

@end
