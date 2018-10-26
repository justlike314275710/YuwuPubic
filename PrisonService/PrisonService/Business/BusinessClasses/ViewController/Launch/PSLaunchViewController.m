//
//  PSLaunchViewController.m
//  PrisonService
//
//  Created by calvin on 2018/5/2.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLaunchViewController.h"

@interface PSLaunchViewController ()

@end

@implementation PSLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, [UIScreen mainScreen].bounds.size) && [@"Portrait" isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImageName = dict[@"UILaunchImageName"];
            break;
        }
    }
    UIImage *launchImage = [UIImage imageNamed:launchImageName];
    UIImageView *launchImageView = [[UIImageView alloc] initWithImage:launchImage];
    [self.view addSubview:launchImageView];
    [launchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
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
