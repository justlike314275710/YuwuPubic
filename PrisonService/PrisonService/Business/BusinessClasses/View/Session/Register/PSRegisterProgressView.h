//
//  PSRegisterProgressView.h
//  PrisonService
//
//  Created by calvin on 2018/4/10.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PSRegisterProgress) {
    PSRegisterProgressMember = 0,  //服刑人员
    PSRegisterProgressIDCard = 1,//上传身份证
    PSRegisterProgressrelation=2,//上传关系证明
    //PSRegisterProgressMessage =3//短信验证
};

@interface PSRegisterProgressView : UIView

@property (nonatomic, assign) PSRegisterProgress progress;

@end
