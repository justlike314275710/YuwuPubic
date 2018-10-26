//
//  PSRewardAndPunishment.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@protocol PSRewardAndPunishment <NSObject>


@end

@interface PSRewardAndPunishment : JSONModel

@property (nonatomic, strong) NSString<Optional> *datayear;
@property (nonatomic, strong) NSString<Optional> *updatedAt;
@property (nonatomic, strong) NSString<Optional> *ndry;

@end
