//
//  RelationGuideVC.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/11.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "RelationGuideVC.h"
#import "MZGuidePages.h"
@interface RelationGuideVC ()

@end

@implementation RelationGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self renderEffect];
    // Do any additional setup after loading the view.
}
- (void)renderEffect{
    
    NSString*RelationGuideOne=NSLocalizedString(@"RelationGuideOne", nil);
    NSString*RelationGuideTwo=NSLocalizedString(@"RelationGuideTwo", nil);
    //数据源
    NSArray *imageArray = @[ RelationGuideOne, RelationGuideTwo];
    
    //  初始化方法1
    MZGuidePages *mzgpc = [[MZGuidePages alloc] init];
    mzgpc.imageDatas = imageArray;
    __weak typeof(MZGuidePages) *weakMZ = mzgpc;
    mzgpc.buttonAction = ^{
        [weakMZ removeFromSuperview];
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    
    [self.view addSubview:mzgpc];
    
    
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
