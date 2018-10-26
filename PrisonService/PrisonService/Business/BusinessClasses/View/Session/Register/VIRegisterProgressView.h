//
//  VIRegisterProgressView.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/28.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, VIRegisterProgress) {
    VIRegisterProgressMember = 0,  //服刑人员
    VIRegisterProgressIDCard = 1,//上传身份证
    VIRegisterProgressMessage =2,//短信验证
    VIRegisterProgressrelation =3// 上传关系证明
};
@interface VIRegisterProgressView : UIView
@property (nonatomic, assign) VIRegisterProgress progress;
@end
