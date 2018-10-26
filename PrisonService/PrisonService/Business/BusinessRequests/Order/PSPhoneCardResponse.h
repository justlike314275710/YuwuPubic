//
//  PSPhoneCardResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSPhoneCard.h"

@interface PSPhoneCardResponse : PSResponse

@property (nonatomic, strong) PSPhoneCard<Optional> *data;

@end
