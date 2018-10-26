//
//  PSJailConfiguration.h
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@interface PSJailConfiguration : JSONModel

@property (nonatomic, assign) CGFloat cost;
@property (nonatomic, assign) NSString<Optional> *face_recognition;//0表示不需要人脸识别，其他都需要

@end
