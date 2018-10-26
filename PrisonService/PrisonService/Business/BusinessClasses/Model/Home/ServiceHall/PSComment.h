//
//  PSComment.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@protocol PSComment <NSObject>

@end

@interface PSComment : JSONModel

@property (nonatomic, strong) NSString<Optional> *contents;
@property (nonatomic, strong) NSString<Optional> *createdAt;

@end
