//
//  PSGuideViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/28.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSGuideViewController.h"

@interface PSGuideViewController ()

@end

@implementation PSGuideViewController

- (void)dealloc {
    [self.displayScrollView.mainView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGPoint oldOffset = [change[NSKeyValueChangeOldKey] CGPointValue];
    CGPoint newOffset = [change[NSKeyValueChangeNewKey] CGPointValue];
    if (newOffset.x < 0) {
        self.displayScrollView.mainView.contentOffset = CGPointZero;
    }
    if (!CGPointEqualToPoint(oldOffset, newOffset) && ((newOffset.x + CGRectGetWidth(self.displayScrollView.mainView.frame)) > self.displayScrollView.mainView.contentSize.width)) {
        if (self.completed) {
            self.completed();
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.displayScrollView.backgroundColor = [UIColor blackColor];
    self.displayScrollView.autoScroll = NO;
    self.displayScrollView.showPageControl = NO;
    self.displayScrollView.infiniteLoop = NO;
    //self.displayScrollView.mainView.bounces = NO;
    @weakify(self)
    [self.displayScrollView setItemDidScrollOperationBlock:^(NSInteger currentIndex) {
        @strongify(self)
        if (self.didScroll) {
            self.didScroll(currentIndex);
        }
    }];
    [self.displayScrollView.mainView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:NULL];
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
