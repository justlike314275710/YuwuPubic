//
//  PSUploadRelationRequest.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUploadBaseRequest.h"
#import "PSUploadRelationResponse.h"
@interface PSUploadRelationRequest : PSUploadBaseRequest
@property (nonatomic, strong) NSData *relationData;
@end
