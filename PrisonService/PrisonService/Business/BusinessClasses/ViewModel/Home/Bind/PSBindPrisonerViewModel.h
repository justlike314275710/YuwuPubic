//
//  PSBindPrisonerViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorViewModel.h"

@interface PSBindPrisonerViewModel : PSVisitorViewModel

@property (nonatomic, strong) NSString *relationShip;//与服刑人员关系
@property (nonatomic, strong) NSString *prisonerNumber;//囚号
@property (nonatomic ,strong) NSString *relationalProofUrl;
@property (nonatomic, strong) UIImage  *relationImage;

- (void)bindPrisonerCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)checkBindDataWithCallback:(CheckDataCallback)callback;


- (void)uploadRelationCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
