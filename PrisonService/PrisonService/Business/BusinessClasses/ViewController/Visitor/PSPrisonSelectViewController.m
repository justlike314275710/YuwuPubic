//
//  PSPrisonContentViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonSelectViewController.h"

@interface PSPrisonSelectViewController ()

@end

@implementation PSPrisonSelectViewController
- (id)init {
    self = [super init];
    if (self) {
        self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuViewContentMargin = 10;
        self.progressHeight = 0.5;
        self.titleSizeSelected = 17;
        self.titleSizeNormal = 17;
        self.titleColorSelected = [UIColor redColor];
        self.titleColorNormal = AppBaseTextColor1;
        self.progressColor = [UIColor redColor];
        self.automaticallyCalculatesItemWidths = YES;
        self.itemMargin = 15;
        self.pageAnimatable = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
