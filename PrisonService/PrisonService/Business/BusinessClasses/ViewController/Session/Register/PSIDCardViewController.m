//
//  PSIDCardViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/10.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSIDCardViewController.h"
#import "PSImagePickerController.h"
#import "PSRegisterViewModel.h"
#import <AipOcrSdk/AipOcrSdk.h>
#import "PSThirdPartyConstants.h"
#import "PSAuthorizationTool.h"

@interface PSIDCardViewController ()

@property (nonatomic, strong) UIButton *frontCardButton;
@property (nonatomic, strong) UIButton *backCardButton;
@property (nonatomic, strong) UIButton *cameraButton;

@end

@implementation PSIDCardViewController
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

- (void)renderContents {
    CGFloat verticalPadding = RELATIVE_HEIGHT_VALUE(10);
    CGSize buttonSize = CGSizeMake(RELATIVE_HEIGHT_VALUE(193), RELATIVE_HEIGHT_VALUE(134));
    CGFloat labelHeight = 15;
    UIFont *labelFont = AppBaseTextFont1;
    UIColor *labelColor = AppBaseTextColor1;
    CGFloat cameraHeight = 57;
    CGFloat verPadding = 25;
    
    self.cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cameraButton addTarget:self action:@selector(cameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraButton setImage:[UIImage imageNamed:@"sessionCameraIcon"] forState:UIControlStateNormal];
    self.cameraButton.layer.cornerRadius = cameraHeight / 2;
    self.cameraButton.layer.masksToBounds = YES;
    [self.view addSubview:self.cameraButton];
    [self.cameraButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(cameraHeight, cameraHeight));
    }];
    
    
    self.frontCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.frontCardButton addTarget:self action:@selector(frontCardCameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.frontCardButton setBackgroundImage:[UIImage imageNamed:@"sessionIDCardFrontBg"] forState:UIControlStateNormal];
    [self.frontCardButton setImage:[UIImage imageNamed:@"sessionIDCardCameraIcon"] forState:UIControlStateNormal];
    [self.view addSubview:self.frontCardButton];
    [self.frontCardButton mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.top.mas_equalTo(0);
        make.top.mas_equalTo(self.cameraButton.mas_bottom).offset(verPadding);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(buttonSize);
    }];
    UILabel *frontLabel = [UILabel new];
    frontLabel.font = labelFont;
    frontLabel.textColor = labelColor;
    frontLabel.textAlignment = NSTextAlignmentCenter;
    frontLabel.text = @"点击上传带头像一面";
    [self.view addSubview:frontLabel];
    [frontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.frontCardButton.mas_left);
        make.right.mas_equalTo(self.frontCardButton.mas_right);
        make.top.mas_equalTo(self.frontCardButton.mas_bottom).offset(5);
        make.height.mas_equalTo(labelHeight);
    }];
    
//    UILabel *cameraLabel = [UILabel new];
//    cameraLabel.font = FontOfSize(10);
//    cameraLabel.textColor = labelColor;
//    cameraLabel.textAlignment = NSTextAlignmentCenter;
//    cameraLabel.text = @"点击上传本人头像";
//    [self.view addSubview:cameraLabel];
//    [cameraLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.frontCardButton.mas_left);
//        make.right.mas_equalTo(self.frontCardButton.mas_right);
//        make.top.mas_equalTo(self.cameraButton.mas_bottom).offset(5);
//        make.height.mas_equalTo(10);
//    }];
    
    self.backCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backCardButton addTarget:self action:@selector(backCardCameraAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.backCardButton setBackgroundImage:[UIImage imageNamed:@"sessionIDCardFrontBg"] forState:UIControlStateNormal];
    [self.backCardButton setImage:[UIImage imageNamed:@"sessionIDCardCameraIcon"] forState:UIControlStateNormal];
    [self.view addSubview:self.backCardButton];
    [self.backCardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(frontLabel.mas_bottom).offset(verticalPadding);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(buttonSize);
    }];
    UILabel *backLabel = [UILabel new];
    backLabel.font = labelFont;
    backLabel.textColor = labelColor;
    backLabel.textAlignment = NSTextAlignmentCenter;
    backLabel.text = @"点击上传带国徽一面";
    [self.view addSubview:backLabel];
    [backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.backCardButton.mas_left);
        make.right.mas_equalTo(self.backCardButton.mas_right);
        make.top.mas_equalTo(self.backCardButton.mas_bottom).offset(5);
        make.height.mas_equalTo(labelHeight);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[AipOcrService shardService] authWithAK:OCR_API_KEY andSK:OCR_SECRET_KEY];
    [self renderContents];
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
