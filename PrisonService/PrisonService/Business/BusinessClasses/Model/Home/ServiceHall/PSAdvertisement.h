//
//  PSAdvertisement.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@protocol PSAdvertisement <NSObject>
@end

@interface PSAdvertisement : JSONModel

@property (nonatomic, strong) NSString<Optional> *id;
@property (nonatomic, strong) NSString<Optional> *imageUrl;

@end
