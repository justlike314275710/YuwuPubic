//
//  PSVistorLawViewController.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVistorLawViewController.h"

@interface PSVistorLawViewController ()

@end

@implementation PSVistorLawViewController

- (id)init {

    NSString*newLawUrl=@"http://39.108.185.51:8081/h5/#/law/list";
    self = [super initWithURL:[NSURL URLWithString:newLawUrl]];
    if (self) {
        
    }
    return self;
}

- (UIImage *)leftItemImage {
    return [UIImage imageNamed:@"universalBackIcon"];
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
