//
//  PSVisitorViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSProvince.h"
#import "PSCity.h"
#import "PSJail.h"

@interface PSVisitorViewModel : PSViewModel
@property (nonatomic , strong) NSString *jailId;
@property (nonatomic , strong) NSString *profile;
@property (nonatomic, strong, readonly) NSArray *provices;
@property (nonatomic, strong, readonly) NSArray *currentCitys;
@property (nonatomic, strong, readonly) NSArray *currentJails;
@property (nonatomic, strong, readonly) PSProvince *selectedProvince;
@property (nonatomic, strong, readonly) PSCity *selectedCity;
@property (nonatomic, strong, readonly) PSJail *selectedJail;
@property (nonatomic, assign) NSInteger provinceSelectIndex;
@property (nonatomic, assign) NSInteger citySelectIndex;
@property (nonatomic, assign) NSInteger jailSelectIndex;
@property (nonatomic, strong) NSString *defaultJailId;
@property (nonatomic, strong) NSString *defaultJailName;


- (void)requestProvincesWithCompletion:(RequestDataCompleted)completed failed:(RequestDataFailed)failed;
- (void)requestCitysOfSelectProvinceWithCompletion:(RequestDataCompleted)completed failed:(RequestDataFailed)failed;
- (void)requestJailsOfSelectCityWithCompletion:(RequestDataCompleted)completed failed:(RequestDataFailed)failed;


- (void)requestJailsProfileWithCompletion:(RequestDataCompleted)completed failed:(RequestDataFailed)failed;

-(void)requestDefaultJailConfigurations:(RequestDataCompleted)completed failed:(RequestDataFailed)failed;

@end
