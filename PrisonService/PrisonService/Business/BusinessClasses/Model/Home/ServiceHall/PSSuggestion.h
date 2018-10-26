//
//  PSSuggestion.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@protocol PSSuggestion <NSObject>

@end

@interface PSSuggestion : JSONModel

@property (nonatomic, strong) NSString<Optional> *id;
@property (nonatomic, strong) NSString<Optional> *title;
@property (nonatomic, strong) NSString<Optional> *contents;
@property (nonatomic, strong) NSString<Optional> *createdAt;
@property (nonatomic, strong) NSString<Optional> *name;

@end
