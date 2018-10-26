//
//  PSCommentsResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSComment.h"

@interface PSCommentsResponse : PSResponse

@property (nonatomic, strong) NSArray<PSComment,Optional> *comments;

@end
