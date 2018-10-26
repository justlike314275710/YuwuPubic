//
//  VIRegisterViewModel.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/8/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorViewModel.h"
#import "PSUserSession.h"
@interface VIRegisterViewModel : PSVisitorViewModel
@property (nonatomic, strong) NSString *phoneNumber;//手机号码
@property (nonatomic, strong) NSString *relationShip;//与服刑人员关系
@property (nonatomic, strong) NSString *prisonerNumber;//囚号
@property (nonatomic, strong) UIImage *avatarImage;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) UIImage *relationImage;
@property (nonatomic, strong) NSString *relationUrl;

@property (nonatomic, strong) UIImage *frontCardImage;
@property (nonatomic, strong) NSString *frontCardUrl;
@property (nonatomic, strong) UIImage *backCardImage;
@property (nonatomic, strong) NSString *backCardUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *cardID;

@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) BOOL agreeProtocol;
@property (nonatomic, strong, readonly) PSUserSession *session;

- (void)checkPersonalDataWithCallback:(CheckDataCallback)callback;
- (void)checkMemberDataWithCallback:(CheckDataCallback)callback;
- (void)checkIDCardDataWithCallback:(CheckDataCallback)callback;
- (void)checkMessageDataWithCallback:(CheckDataCallback)callback;
- (void)checkProtocolDataWithCallback:(CheckDataCallback)callback;


- (void)requestCodeCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)uploadAvatarCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

- (void)uploadRelationCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

- (void)uploadIDCardCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback frontOrBack:(BOOL)front;
- (void)checkAddFamilesDataWithCallback:(CheckDataCallback)callback;
- (void)registerCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)checkWhiteListCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)addFamilesCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
@end
