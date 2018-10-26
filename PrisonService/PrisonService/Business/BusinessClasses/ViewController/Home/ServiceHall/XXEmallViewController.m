//
//  XXEmallViewController.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "XXEmallViewController.h"
#import "PSBusinessConstants.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "JSInterface.h"
#import "WXApi.h"
@interface XXEmallViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic) JSContext *jsContext;
@end

@implementation XXEmallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBar.hidden=YES;
    [self customeInterface];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(aliPayResult:) name:@"aliPayResult" object:nil];
    [center addObserver:self selector:@selector(wxPayResult:) name:@"wxPayResult" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
     NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:@"aliPayResult" object:nil];
    [center removeObserver:self name:@"wxPayResult" object:nil];
}

//支付宝支付结果
-(void)aliPayResult:(NSNotification*)resultStatus{
    _jsContext=[_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString*Status=resultStatus.userInfo[@"resultStatus"];
    NSString*memo=resultStatus.userInfo[@"memo"];
    NSString*result=resultStatus.userInfo[@"result"];
    NSData *jsonData = [result dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resultdic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSDictionary*dic=@{@"resultStatus":Status,@"result":resultdic,@"memo":memo};
    [_jsContext evaluateScript:[NSString stringWithFormat:@"aliPayResult('%@')",[self convertToJsonData:dic]]];
}


//微信支付结果
-(void)wxPayResult:(NSNotification*)resultStatus{
     _jsContext=[_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [_jsContext evaluateScript:[NSString stringWithFormat:@"wxPayResult('%@')",resultStatus.userInfo[@"errCode"]]];
}


- (void)customeInterface
{
    NSURL*url=[NSURL URLWithString:EmallUrl];
    NSString*cookieToken=[LXFileManager readUserDataForKey:@"cookieToken"];
    NSDictionary *properties = [[NSMutableDictionary alloc] init];
    [properties setValue:cookieToken forKey:NSHTTPCookieValue];
    [properties setValue:@"token" forKey:NSHTTPCookieName];
    [properties setValue:[url host] forKey:NSHTTPCookieDomain];
    [properties setValue:[url path] forKey:NSHTTPCookiePath];
    [properties setValue:[NSDate dateWithTimeIntervalSinceNow:60*60] forKey:NSHTTPCookieExpires];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT )];
    _webView.delegate = self;
    NSHTTPCookie *cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    [_webView loadRequest:[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10]];
    [self.view addSubview:_webView];
     _webView.scrollView.bounces=NO;

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    JSInterface*interface=[JSInterface new];
    context[@"JSInterface"]=interface;

}


-(NSString *)convertToJsonData:(NSDictionary *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    [mutStr replaceOccurrencesOfString:@"\\" withString:@"" options:1 range:NSMakeRange(0, mutStr.length)];
    return mutStr;
    
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
