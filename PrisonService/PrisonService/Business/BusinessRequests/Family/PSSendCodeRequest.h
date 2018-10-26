//
//  PSSendCodeRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/18.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyBaseRequest.h"
#import "PSSendCodeResponse.h"

@interface PSSendCodeRequest : PSFamilyBaseRequest

@property (nonatomic, strong) NSString *phone;

@end
