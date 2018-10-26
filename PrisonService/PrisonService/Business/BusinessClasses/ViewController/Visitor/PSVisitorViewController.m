//
//  PSVisitorViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorViewController.h"
#import "PSPrisonContentViewController.h"
#import "PSPrisonSelectView.h"
#import "PSVisitorViewModel.h"
#import "PSRegisterViewModel.h"
#import "PSVistorHomeViewController.h"
#import "PSHomeViewController.h"
#import "PSHomeViewModel.h"

@interface PSVisitorViewController ()

@property (nonatomic, strong) PSPrisonSelectView *prisonSelectView;

@end

@implementation PSVisitorViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString*Select_jails=NSLocalizedString(@"Select_jails", @"请选择监狱");
        self.title = Select_jails;
    }
    return self;
}

- (IBAction)useAction:(id)sender {
    PSVisitorViewModel *visitorViewModel = (PSVisitorViewModel *)self.viewModel;
    if (visitorViewModel.selectedJail) {
        if (self.callback) {
            self.callback(visitorViewModel.selectedJail);
        }

//        [self.navigationController pushViewController:[[PSVistorHomeViewController alloc]initWithViewModel:[[PSHomeViewModel alloc] init]] animated:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
         NSString*Select_jails=NSLocalizedString(@"Select_jails", @"请选择监狱");
        [PSTipsView showTips:Select_jails];
    }
}



- (void)initialize {
    
}

- (void)selectAction {
     
    PSPrisonContentViewController *prisonSelectViewController = [[PSPrisonContentViewController alloc] initWithViewModel:self.viewModel];
    [prisonSelectViewController setSelectedJailCallback:^{
        [self visitorDidSelectedJail];
    }];
    //[self presentViewController:prisonSelectViewController animated:YES completion:nil];
     [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:prisonSelectViewController animated:YES completion:nil];
}

- (void)visitorDidSelectedJail {
   // PSVisitorViewModel *visitorViewModel = (PSVisitorViewModel *)self.viewModel;
     PSRegisterViewModel *registerViewModel = (PSRegisterViewModel *)self.viewModel;
    self.prisonSelectView.proviceLabel.text = registerViewModel.selectedProvince.name;
    self.prisonSelectView.cityLabel.text = registerViewModel.selectedCity.name;
    self.prisonSelectView.prisonLabel.text = registerViewModel.selectedJail.title;
    //NSString*jailid=registerViewModel.selectedJail.id;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.prisonSelectView = [[PSPrisonSelectView alloc] init];
    @weakify(self)
    [self.prisonSelectView.proviceButton bk_whenTapped:^{
        @strongify(self)
        [self selectAction];
    }];
    [self.prisonSelectView.cityButton bk_whenTapped:^{
        @strongify(self)
        [self selectAction];
    }];
    [self.prisonSelectView.prisonButton bk_whenTapped:^{
        @strongify(self)
        [self selectAction];
    }];
    [self.view addSubview:self.prisonSelectView];
    [self.prisonSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    UIButton *useButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [useButton addTarget:self action:@selector(useAction:) forControlEvents:UIControlEventTouchUpInside];
    NSString*determine=NSLocalizedString(@"determine", @"确定");
    
    [useButton setTitle:determine forState:UIControlStateNormal];
    [useButton setBackgroundImage:[[UIImage imageNamed:@"universalBtBg"] stretchImage] forState:UIControlStateNormal];
    [self.view addSubview:useButton];
    useButton.titleLabel.numberOfLines=0;
    [useButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-100);
        make.size.mas_equalTo(CGSizeMake(95, 36));
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
