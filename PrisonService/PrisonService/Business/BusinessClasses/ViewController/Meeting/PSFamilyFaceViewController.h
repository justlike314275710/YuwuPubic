//
//  PSFamilyFaceViewController.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
@class PSFamilyFaceViewController;
typedef void(^FaceAuthCompletion)(BOOL successful);
@interface PSFamilyFaceViewController : PSBusinessViewController
@property (nonatomic, copy) FaceAuthCompletion completion;
//@property (nonatomic, strong)NSString*iconUrl;
//@property (nonatomic, strong)PSFamilyFaceViewController*FaceAuthViewController;
@end
