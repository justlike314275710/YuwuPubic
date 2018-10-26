//
//  PSBaseServiceViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBasePrisonerViewModel.h"

@interface PSBaseServiceViewModel : PSBasePrisonerViewModel

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) BOOL hasNextPage;

@end
