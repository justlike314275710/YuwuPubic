//
//  PSUploadAvatarRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSUploadBaseRequest.h"
#import "PSUploadAvatarResponse.h"

@interface PSUploadAvatarRequest : PSUploadBaseRequest

@property (nonatomic, strong) NSData *avatarData;

@end
