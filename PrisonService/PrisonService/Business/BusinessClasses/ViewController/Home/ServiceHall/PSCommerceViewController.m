//
//  PSCommerceViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCommerceViewController.h"
#import "PSBusinessConstants.h"
#import <WebKit/WebKit.h>
#import "PSAlertView.h"

@interface WeakWebViewScriptMessageDelegate : NSObject<WKScriptMessageHandler>

//WKScriptMessageHandler 这个协议类专门用来处理JavaScript调用原生OC的方法
@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;

@end
@implementation WeakWebViewScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

#pragma mark - WKScriptMessageHandler
//遵循WKScriptMessageHandler协议，必须实现如下方法，然后把方法向外传递
//通过接收JS传出消息的name进行捕捉的回调方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    if ([self.scriptDelegate respondsToSelector:@selector(userContentController:didReceiveScriptMessage:)]) {
        [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
    }
}

@end


@interface PSCommerceViewController ()<WKScriptMessageHandler>

@end

//CommerceUrl  ProCommerceUrl
//http://www.sinog2c.com
@implementation PSCommerceViewController
- (id)init {
   
   self = [super initWithURL:[NSURL URLWithString:ProCommerceUrl]];
    if (self) {
        self.enableUpdateTitle = NO;
        NSString*e_mall=NSLocalizedString(@"e_mall", @"电子商务");
        self.title = e_mall;
        //[self creatWebview];
    }
    return self;
}

- (UIImage *)leftItemImage {
    return [UIImage imageNamed:@"universalBackIcon"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
   // self.navigationController.navigationBar.hidden=YES;
    //[self creatWebview];
   // [self cookieGo];

}

-(void)cookieGo{
    NSURL *cookieHost = [NSURL URLWithString:EmallHostUrl];
    NSHTTPCookie *cookieClient2 = [NSHTTPCookie cookieWithProperties:[NSDictionary dictionaryWithObjectsAndKeys:[cookieHost host], NSHTTPCookieDomain,[cookieHost path], NSHTTPCookiePath,@"httpOnly",  NSHTTPCookieName, @"false", NSHTTPCookieValue,nil]];
    
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookieClient2];
    

    
    WKUserContentController* userContentController = WKUserContentController.new;
    NSString*cookieToken= [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
    
    NSString *jsString = [NSString stringWithFormat:@"token=%@ ", cookieToken];
    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource:jsString injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    
    [userContentController addUserScript:cookieScript];
    
    WKWebViewConfiguration* webViewConfig = WKWebViewConfiguration.new;
    
    webViewConfig.userContentController = userContentController;
    
    WKWebView * wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:webViewConfig];
    [self.view addSubview:wkWebView];
 //   [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:CommerceUrl]]];
//    wkWebView.UIDelegate = wkWebView;
//    wkWebView.navigationDelegate = wkWebView;
    
   
    NSMutableDictionary *cookieDic = [NSMutableDictionary dictionary];
    NSMutableString *cookieValue = [NSMutableString stringWithFormat:@""]; NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies])
    {
        [cookieDic setObject:cookie.value forKey:cookie.name];
        
    } // cookie重复，先放到字典进行去重，再进行拼接
    for (NSString *key in cookieDic)
    { NSString *appendString = [NSString stringWithFormat:@"%@=%@;", key, [cookieDic valueForKey:key]];
        [cookieValue appendString:appendString];
        
    }
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:EmallHostUrl]];
    [request addValue:jsString forHTTPHeaderField:@"Cookie"];
 
    [wkWebView loadRequest:request];
    

}

-(void)creatWebview{
    
//        WeakWebViewScriptMessageDelegate *weakScriptMessageDelegate = [[WeakWebViewScriptMessageDelegate alloc] initWithDelegate:self];
    //创建网页配置对象
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKPreferences *preference = [[WKPreferences alloc]init];
    //设置是否支持javaScript 默认是支持的
    preference.javaScriptEnabled = YES;
    config.preferences.minimumFontSize = 10;
    // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
    preference.javaScriptCanOpenWindowsAutomatically = YES;
    config.preferences = preference;
    config.processPool=[[WKProcessPool alloc]init];
    //这个类主要用来做native与JavaScript的交互管理
    WKUserContentController * wkUController = [[WKUserContentController alloc] init];
    NSString*cookieToken= [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
    
    NSString *jsString = [NSString stringWithFormat:@"document.cookie= ’token=%@‘ ", cookieToken];
    
    WKUserScript * cookieScript = [[WKUserScript alloc]
                                   initWithSource: jsString
                                   injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [wkUController addUserScript:cookieScript];
    config.userContentController =wkUController;
    //注册一个name为jsToOcNoPrams的js方法 设置处理接收JS方法的对象
  //  [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"tokenTimeLimit"];
//    [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcWithPrams"];
    
    config.userContentController = wkUController;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:EmallHostUrl]];
    [request setValue:[self getCookieValue] forHTTPHeaderField:@"Cookie"];
    [self.webView loadRequest:request];
  
 
}

-(void)roloadAction{
    [self.webView reload];
}
-(void)saveLocalStorage{
    NSString*token= [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
        // 设置localStorage
     NSString *jsString = [NSString stringWithFormat:@"localStorage.setItem('token','%@') ", token];
    [self.webView evaluateJavaScript:jsString completionHandler:nil];
  
}
-(void)saveCookie{
    NSString*token= [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
    // 设置localStorage
    //NSString *jsString = [NSString stringWithFormat:@"document.cookie=’token=%@‘ ", token];
    NSString *jsString = [NSString stringWithFormat:@"cookie.setItem('token','%@')", token];
    [self.webView evaluateJavaScript:jsString completionHandler:^(id resp, NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
    
}

//-(void)saveTempLocalStorage{
//    // 设置localStorage
//    NSString *jsString = [NSString stringWithFormat:@"localStorage.setItem('token','')"];
//    [self.webView evaluateJavaScript:jsString completionHandler:nil];
//
//}
#pragma mark -- webViewdelegate
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
   // [self saveCookie];
 // [self creatWebview];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:CommerceUrl]]];

   // [self loadRequestWithUrlString:CommerceUrl];
    
 

}


- (NSMutableString*)getCookieValue{
    // 在此处获取返回的cookie
    NSMutableDictionary *cookieDic = [NSMutableDictionary dictionary];
    NSMutableString *cookieValue = [NSMutableString stringWithFormat:@""];
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        [cookieDic setObject:cookie.value forKey:cookie.name];
    }
    // cookie重复，先放到字典进行去重，再进行拼接
    for (NSString *key in cookieDic) {
        NSString *appendString = [NSString stringWithFormat:@"%@=%@;", key, [cookieDic valueForKey:key]];
        [cookieValue appendString:appendString];
    }
    return cookieValue;
}


- (void)loadRequestWithUrlString:(NSString *)urlString {
    
    // 在此处获取返回的cookie
    NSMutableDictionary *cookieDic = [NSMutableDictionary dictionary];
    
    NSMutableString *cookieValue = [NSMutableString stringWithFormat:@""];
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        [cookieDic setObject:cookie.value forKey:cookie.name];
    }
    
    // cookie重复，先放到字典进行去重，再进行拼接
    for (NSString *key in cookieDic) {
        NSString *appendString = [NSString stringWithFormat:@"%@=%@;", key, [cookieDic valueForKey:key]];
        [cookieValue appendString:appendString];
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request addValue:cookieValue forHTTPHeaderField:@"Cookie"];
    
    [self.webView loadRequest:request];
}

-(void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error{
    NSLog(@"加载失败%@",error);
}

//被自定义的WKScriptMessageHandler在回调方法里通过代理回调回来，绕了一圈就是为了解决内存不释放的问题
//通过接收JS传出消息的name进行捕捉的回调方法
//- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
//    NSLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
//    //用message.body获得JS传出的参数体
//    NSDictionary * parameter = message.body;
//    //JS调用OC
//    if([message.name isEqualToString:@"tokenTimeLimit"]){
//        [PSAlertView showWithTitle:@"提示" message:@" 您的身份已过期,请重新使用正确的验证码进行登录" messageAlignment:NSTextAlignmentCenter image:nil handler:^(PSAlertView *alertView, NSInteger buttonIndex) {
//            
//        } buttonTitles:@"取消",@"确定", nil];
//        
//    }else if([message.name isEqualToString:@"jsToOcWithPrams"]){
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"js调用到了oc" message:parameter[@"params"] preferredStyle:UIAlertControllerStyleAlert];
//        [alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        }])];
//        [self presentViewController:alertController animated:YES completion:nil];
//    }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[self.webView configuration].userContentController removeScriptMessageHandlerForName:@"tokenTimeLimit"];
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
