//
//  PSAddFamiliesViewController.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAddFamiliesViewController.h"
#import "PSRoundRectTextField.h"
#import "PSRegisterViewModel.h"
#import <AipOcrSdk/AipOcrSdk.h>
#import "PSThirdPartyConstants.h"
#import "PSAuthorizationTool.h"
#import "PSImagePickerController.h"
#import "PSSessionManager.h"
#import "PSAlertView.h"
@interface PSAddFamiliesViewController ()<UIScrollViewDelegate>
@property (nonatomic , strong) UIScrollView *addScrollView;
@property (nonatomic, strong) UIButton *frontCardButton;
@property (nonatomic, strong) UIButton *backCardButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic ,strong) UIButton *relationButton;
@end

@implementation PSAddFamiliesViewController
- (instancetype)initWithViewModel:(PSViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        self.title = @"添加亲属";
    }
    return self;
}

#pragma mark -- 头像上传
- (IBAction)cameraAction:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意" message:@"请上传本人真实.清晰头像!否则注册无法通过!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    @weakify(self)
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [PSAuthorizationTool checkAndRedirectCameraAuthorizationWithBlock:^(BOOL result) {
            PSImagePickerController *picker = [[PSImagePickerController alloc] initWithCropHeaderImageCallback:^(UIImage *cropImage) {
                @strongify(self)
                [self containFace:cropImage];
            }];
            [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
            picker.delegate =self;
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
        }];
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:takePhotoAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

-(void)containFace:(UIImage*)faceImage{
    CIContext * context = [CIContext contextWithOptions:nil];
    NSDictionary * param = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    CIDetector * faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:param];
    CIImage * image = [CIImage imageWithCGImage:faceImage.CGImage];
    NSArray * detectResult = [faceDetector featuresInImage:image];
    if (detectResult.count>0) {
        //有脸
        [self handlePickerImage:faceImage];
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [PSTipsView showTips:@"您上传的头像未能通过人脸识别,请重新上传"];
        });
        
    }
}

- (void)handlePickerImage:(UIImage *)image {
    PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;
    registerViewModel.avatarImage = image;
    @weakify(self)
    [[PSLoadingView sharedInstance] show];
    [registerViewModel uploadAvatarCompleted:^(PSResponse *response) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        if (response.code == 200) {
            [PSTipsView showTips:@"头像上传成功"];
            [self.cameraButton setImage:image forState:UIControlStateNormal];
        }else{
            [PSTipsView showTips:@"头像上传失败"];
        }
    } failed:^(NSError *error) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        [self showNetError];
    }];
}
#pragma mark -- 身份证上传
- (IBAction)frontCardCameraAction:(id)sender {
    [PSAuthorizationTool checkAndRedirectCameraAuthorizationWithBlock:^(BOOL successful) {
        if (successful) {
            UIViewController *viewController = [AipCaptureCardVC ViewControllerWithCardType:CardTypeLocalIdCardFont andImageHandler:^(UIImage *image) {
                @weakify(self)
                [[AipOcrService shardService] detectIdCardFrontFromImage:image withOptions:nil successHandler:^(id result) {
                    @strongify(self)
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self closeCamera:nil];
                        [self handleFrontPickerImage:image result:result];
                    });
                } failHandler:^(NSError *err) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self closeCamera:nil];
                        [PSTipsView showTips:@"身份证识别错误"];
                    });
                }];
            }];
            UIViewController *topViewController = ((UINavigationController *)viewController).topViewController;
            topViewController.navigationItem.leftBarButtonItem = [self cameraBackItem];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
        }
    }];
}

- (IBAction)backCardCameraAction:(id)sender {
    [PSAuthorizationTool checkAndRedirectCameraAuthorizationWithBlock:^(BOOL successful) {
        if (successful) {
            UIViewController *viewController = [AipCaptureCardVC ViewControllerWithCardType:CardTypeLocalIdCardBack andImageHandler:^(UIImage *image) {
                @weakify(self)
                [[AipOcrService shardService] detectIdCardBackFromImage:image withOptions:nil successHandler:^(id result) {
                    @strongify(self)
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self closeCamera:nil];
                        [self handleBackPickerImage:image result:result];
                    });
                } failHandler:^(NSError *err) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self closeCamera:nil];
                        [PSTipsView showTips:@"身份证识别错误"];
                    });
                }];
            }];
            UIViewController *topViewController = ((UINavigationController *)viewController).topViewController;
            topViewController.navigationItem.leftBarButtonItem = [self cameraBackItem];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
        }
    }];
}



- (IBAction)closeCamera:(id)sender {
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleFrontPickerImage:(UIImage *)image result:(id)result {
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSLog(@"%@",result);
        NSString *name = result[@"words_result"][@"姓名"][@"words"];
        NSString *gender = result[@"words_result"][@"性别"][@"words"];
        NSString *cardID = result[@"words_result"][@"公民身份号码"][@"words"];
        if (name.length == 0) {
            [PSTipsView showTips:@"未能识别到姓名，请重试"];
            return;
        }
        if (gender.length == 0) {
            [PSTipsView showTips:@"未能识别到性别，请重试"];
            return;
        }
        if (cardID.length == 0) {
            [PSTipsView showTips:@"未能识别到身份证号码，请重试"];
            return;
        }
        PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;
        registerViewModel.frontCardImage = image;
        registerViewModel.name = name;
        registerViewModel.gender = gender;
        registerViewModel.cardID = cardID;
        @weakify(self)
        [[PSLoadingView sharedInstance] show];
        [registerViewModel uploadIDCardCompleted:^(PSResponse *response) {
            @strongify(self)
            [[PSLoadingView sharedInstance] dismiss];
            if (response.code == 200) {
                [self.frontCardButton setImage:image forState:UIControlStateNormal];
            }else{
                [PSTipsView showTips:@"身份证上传失败"];
            }
        } failed:^(NSError *error) {
            @strongify(self)
            [[PSLoadingView sharedInstance] dismiss];
            [self showNetError];
        } frontOrBack:YES];
    }else{
        [PSTipsView showTips:@"未能识别身份证"];
    }
}

- (void)handleBackPickerImage:(UIImage *)image result:(id)result {
    [self closeCamera:nil];
    PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;
    registerViewModel.backCardImage = image;
    @weakify(self)
    [[PSLoadingView sharedInstance] show];
    [registerViewModel uploadIDCardCompleted:^(PSResponse *response) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        if (response.code == 200) {
            [self.backCardButton setImage:image forState:UIControlStateNormal];
        }else{
            [PSTipsView showTips:@"身份证上传失败"];
        }
    } failed:^(NSError *error) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        [self showNetError];
    } frontOrBack:NO];
}
- (UIBarButtonItem *)cameraBackItem {
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect leftFrame = CGRectMake(0, 0, 40, 44);
    [lButton setImage:[self leftItemImage] forState:UIControlStateNormal];
    lButton.frame = leftFrame;
    lButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [lButton addTarget:self action:@selector(closeCamera:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    return leftItem;
}

#pragma mark -- 家属关系图上传
- (IBAction)relationCameraAction:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    @weakify(self)
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [PSAuthorizationTool checkAndRedirectCameraAuthorizationWithBlock:^(BOOL result) {
            PSImagePickerController *picker = [[PSImagePickerController alloc] initWithCropHeaderImageCallback:^(UIImage *cropImage) {
                @strongify(self)
               [self handleRelationPickerImage:cropImage];
            }];
            [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
            picker.delegate = self;
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
        }];
    }];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [PSAuthorizationTool checkAndRedirectPhotoAuthorizationWithBlock:^(BOOL result) {
            PSImagePickerController *picker = [[PSImagePickerController alloc] initWithCropHeaderImageCallback:^(UIImage *cropImage) {
                @strongify(self)
                [self handleRelationPickerImage:cropImage];
            }];
            [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            picker.delegate = self;
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
        }];
    }];
    [alert addAction:cancelAction];
    [alert addAction:takePhotoAction];
    [alert addAction:albumAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)handleRelationPickerImage:(UIImage *)image {
    PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;
    registerViewModel.relationImage = image;
    @weakify(self)
    [[PSLoadingView sharedInstance] show];
    [registerViewModel uploadRelationCompleted:^(PSResponse *response) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        if (response.code == 200) {
            [self.relationButton setImage:image forState:UIControlStateNormal];
        }else{
            [PSTipsView showTips:@"家属关系图上传失败"];
        }
    } failed:^(NSError *error) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        [self showNetError];
    }];
}

#pragma mark -- 添加附属家属
-(void)checkFamilesDataAction{
    PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;
    @weakify(self)
    [registerViewModel checkAddFamilesDataWithCallback:^(BOOL successful, NSString *tips) {
        @strongify(self)
        if (successful) {
            [self addFamilesAction];
        } else {
            [PSTipsView showTips:tips];
        }
    }];
}
-(void)addFamilesAction{
    [[PSLoadingView sharedInstance]show];
    PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;

    [registerViewModel addFamilesCompleted:^(PSResponse *response) {
        [[PSLoadingView sharedInstance] dismiss];
        if (response.code == 200) {
            //[PSTipsView showTips:response.msg ? response.msg : @"添加家属提交成功"];
            [PSAlertView showWithTitle:nil message:@"已完成添加，需监狱审批后方可会见" messageAlignment:NSTextAlignmentCenter image:nil handler:^(PSAlertView *alertView, NSInteger buttonIndex) {
                if (buttonIndex==0) {
                    [self.navigationController popViewControllerAnimated:YES];
                }
            } buttonTitles:@"确定", nil];
        }else{
            [PSTipsView showTips:response.msg ? response.msg : @"添加家属提交失败"];
        }
       
    } failed:^(NSError *error) {
         [[PSLoadingView sharedInstance] dismiss];
         [self showNetError];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [[AipOcrService shardService] authWithAK:OCR_API_KEY andSK:OCR_SECRET_KEY];
    [self renderContents];
    // Do any additional setup after loading the view.
}


- (void)renderContents {
    _addScrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    _addScrollView.delegate=self;
    _addScrollView.contentSize=CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*1.5);
    _addScrollView.scrollEnabled=YES;
    _addScrollView.userInteractionEnabled=YES;
    _addScrollView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_addScrollView];

    CGFloat sidePadding = 15;
    CGFloat vHeight = 88;
    CGFloat verticalPadding = RELATIVE_HEIGHT_VALUE(25);
    UIFont  *textFont = FontOfSize(12);
    UIColor *titleColor = UIColorFromHexadecimalRGB(0x7d8da2);
    UIColor *textColor = AppBaseTextColor1;
    CGFloat cameraHeight = 57;
    CGFloat  BUTTON_SCREEN_WIDTH=RELATIVE_HEIGHT_VALUE(193);
    CGFloat  BUTTON_SCREEN_HEIGHT=RELATIVE_HEIGHT_VALUE(134);
    CGFloat  CenterX=CGRectGetMidX(self.addScrollView.frame)-BUTTON_SCREEN_HEIGHT/2-verticalPadding;

    PSPrisonerDetail *prisonerDetail = nil;
    NSInteger index = [PSSessionManager sharedInstance].selectedPrisonerIndex;
    NSArray *details = [PSSessionManager sharedInstance].passedPrisonerDetails;
    if (index >= 0 && index < details.count) {
        prisonerDetail = details[index];
    }
    NSString*name=prisonerDetail ? prisonerDetail.name : @"";
    
    PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;
    UILabel *titleOneLabel = [UILabel new];
    titleOneLabel.frame=CGRectMake(verticalPadding, sidePadding, SCREEN_WIDTH-2*verticalPadding, 13);
    titleOneLabel.font = textFont;
    titleOneLabel.textColor = titleColor;
    NSString*titleName=[NSString stringWithFormat:@"■ 服刑人员信息(%@)",name];
    titleOneLabel.text = titleName;
    [_addScrollView addSubview:titleOneLabel];


    
    UITextField *relationTextField = [[PSRoundRectTextField alloc] init];
    relationTextField.frame=CGRectMake(2*verticalPadding, CGRectGetMaxY(titleOneLabel.frame)+sidePadding, SCREEN_WIDTH-4*verticalPadding, vHeight/2);
    relationTextField.font = textFont;
    NSString*enter_Relationship=NSLocalizedString(@"enter_Relationship", @"请输入与服刑人员关系");
    relationTextField.placeholder = enter_Relationship;
    relationTextField.textColor = textColor;
    relationTextField.textColor = AppBaseTextColor1;
    [_addScrollView addSubview:relationTextField];
    [relationTextField setBk_didEndEditingBlock:^(UITextField *textField) {
        registerViewModel.relationShip=textField.text;
    }];
    
    
    UILabel *titleTwoLabel = [UILabel new];
    titleTwoLabel.frame=CGRectMake(verticalPadding, CGRectGetMaxY(relationTextField.frame)+sidePadding, SCREEN_WIDTH-2*verticalPadding, 13);
    titleTwoLabel.font = textFont;
    titleTwoLabel.textColor = titleColor;
    titleTwoLabel.text = @"■ 家属信息";
    [_addScrollView addSubview:titleTwoLabel];
    
    self.cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cameraButton.frame=CGRectMake(CGRectGetMidX(_addScrollView.frame)-verticalPadding, CGRectGetMaxY(titleTwoLabel.frame)+sidePadding, cameraHeight, cameraHeight);
    [self.cameraButton addTarget:self action:@selector(cameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraButton setImage:[UIImage imageNamed:@"sessionCameraIcon"] forState:UIControlStateNormal];
    self.cameraButton.layer.cornerRadius = cameraHeight / 2;
    self.cameraButton.layer.masksToBounds = YES;
    [_addScrollView addSubview:self.cameraButton];

    
    
    self.frontCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _frontCardButton.frame=CGRectMake(CenterX, CGRectGetMaxY(self.cameraButton.frame)+sidePadding, BUTTON_SCREEN_WIDTH, BUTTON_SCREEN_HEIGHT);
    [self.frontCardButton addTarget:self action:@selector(frontCardCameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.frontCardButton setBackgroundImage:[UIImage imageNamed:@"sessionIDCardFrontBg"] forState:UIControlStateNormal];
    [self.frontCardButton setImage:[UIImage imageNamed:@"sessionIDCardCameraIcon"] forState:UIControlStateNormal];
    [_addScrollView addSubview:self.frontCardButton];
  
    UILabel *frontLabel = [UILabel new];
    frontLabel.frame=CGRectMake(CenterX, CGRectGetMaxY(_frontCardButton.frame)+5, BUTTON_SCREEN_WIDTH, 13);
    frontLabel.font = AppBaseTextFont2;
    frontLabel.textColor = AppBaseTextColor1;
    frontLabel.textAlignment = NSTextAlignmentCenter;
    frontLabel.text = @"点击上传带头像一面";
    [_addScrollView addSubview:frontLabel];

    
    
    self.backCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backCardButton.frame=CGRectMake(CenterX, CGRectGetMaxY(frontLabel.frame)+sidePadding, BUTTON_SCREEN_WIDTH, BUTTON_SCREEN_HEIGHT);
    [self.backCardButton addTarget:self action:@selector(backCardCameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.backCardButton setBackgroundImage:[UIImage imageNamed:@"sessionIDCardFrontBg"] forState:UIControlStateNormal];
    [self.backCardButton setImage:[UIImage imageNamed:@"sessionIDCardCameraIcon"] forState:UIControlStateNormal];
    [_addScrollView addSubview:self.backCardButton];

    UILabel *backLabel = [UILabel new];
    backLabel.font = AppBaseTextFont2;
    backLabel.textColor = AppBaseTextColor1;
    backLabel.textAlignment = NSTextAlignmentCenter;
    backLabel.text = @"点击上传带国徽一面";
    [_addScrollView addSubview:backLabel];
    backLabel.frame=CGRectMake(CenterX, CGRectGetMaxY(_backCardButton.frame)+5, BUTTON_SCREEN_WIDTH, 13);
    
    UILabel *titleThreeLabel = [UILabel new];
    titleThreeLabel.frame=CGRectMake(verticalPadding, CGRectGetMaxY(backLabel.frame)+sidePadding, SCREEN_WIDTH-2*verticalPadding, 13);
    titleThreeLabel.font = textFont;
    titleThreeLabel.textColor = titleColor;
    titleThreeLabel.text = @"■ 上传关系证明";
    [_addScrollView addSubview:titleThreeLabel];
    
    self.relationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.relationButton.frame=CGRectMake(CenterX, CGRectGetMaxY(titleThreeLabel.frame)+sidePadding, BUTTON_SCREEN_WIDTH, BUTTON_SCREEN_HEIGHT);
    [self.relationButton addTarget:self action:@selector(relationCameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.relationButton setBackgroundImage:[UIImage imageNamed:@"sessionRelationBackgroud"] forState:UIControlStateNormal];
    [self.relationButton setImage:[UIImage imageNamed:@"sessionIDCardCameraIcon"] forState:UIControlStateNormal];
    [_addScrollView addSubview:self.relationButton];
    
    UIButton*OptionalButton=[UIButton buttonWithType:UIButtonTypeCustom];
    OptionalButton.frame=CGRectMake(CGRectGetMaxX(self.relationButton.frame)-40, CGRectGetMinY(self.relationButton.frame), 40, 32);
    [_addScrollView addSubview:OptionalButton];
    [OptionalButton setBackgroundImage:[UIImage imageNamed:@"OptionalBg"] forState:UIControlStateNormal];
    [OptionalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.relationButton.mas_top);
        make.right.mas_equalTo(self.relationButton.mas_right);
        make.size.mas_equalTo(CGSizeMake(40, 32));
    }];
    
    UILabel *relationButtonLabel = [UILabel new];
    relationButtonLabel.frame=CGRectMake(CenterX, CGRectGetMaxY(_relationButton.frame)+5, BUTTON_SCREEN_WIDTH, 13);
    relationButtonLabel.font = AppBaseTextFont2;
    relationButtonLabel.textColor = AppBaseTextColor1;
    relationButtonLabel.textAlignment = NSTextAlignmentCenter;
    relationButtonLabel.text = @"点击上传关系证明图";
    [_addScrollView addSubview:relationButtonLabel];
 
    UILabel *nextLabel = [UILabel new];
    nextLabel.frame=CGRectMake(CenterX, CGRectGetMaxY(relationButtonLabel.frame)+5, BUTTON_SCREEN_WIDTH, 13);
    nextLabel.font = AppBaseTextFont2;
    nextLabel.textColor = [UIColor redColor];;
    nextLabel.textAlignment = NSTextAlignmentCenter;
    nextLabel.text = @"(非必填项,可继续下一步)";
    [_addScrollView addSubview:nextLabel];

    
    UIButton *bindButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bindButton.frame=CGRectMake(SCREEN_WIDTH/2-45, CGRectGetMaxY(nextLabel.frame)+verticalPadding+sidePadding, 90, 35);
    [bindButton addTarget:self action:@selector(checkFamilesDataAction) forControlEvents:UIControlEventTouchUpInside];
    bindButton.titleLabel.font = AppBaseTextFont1;
    [bindButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bindButton setTitle:@"立即添加" forState:UIControlStateNormal];
    [bindButton setBackgroundImage:[[UIImage imageNamed:@"universalBtBg"] stretchImage] forState:UIControlStateNormal];
    [_addScrollView addSubview:bindButton];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
