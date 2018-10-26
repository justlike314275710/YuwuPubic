//
//  PSCommentsRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseMailBoxRequest.h"
#import "PSCommentsResponse.h"

@interface PSCommentsRequest : PSBaseMailBoxRequest

@property (nonatomic, strong) NSString *suggestionID;

@end
