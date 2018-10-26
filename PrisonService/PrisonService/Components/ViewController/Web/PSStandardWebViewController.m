//
//  PSStandardWebViewController.m
//  Start
//
//  Created by calvin on 16/7/24.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import "PSStandardWebViewController.h"

@interface PSStandardWebViewController ()

@end

@implementation PSStandardWebViewController
- (void)registerJsHandlers {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _bridge = [WKWebViewJavascriptBridge bridgeForWebView:self.webView];
    [_bridge setWebViewDelegate:self];
    [self registerJsHandlers];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [super webView:webView didStartProvisionalNavigation:navigation];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    [super webView:webView didCommitNavigation:navigation];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [super webView:webView didFinishNavigation:navigation];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [super webView:webView didFailNavigation:navigation withError:error];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if (navigationAction.targetFrame) {
        [super webView:webView decidePolicyForNavigationAction:navigationAction decisionHandler:decisionHandler];
    }else{
        decisionHandler(WKNavigationActionPolicyCancel);
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    [super webView:webView decidePolicyForNavigationResponse:navigationResponse decisionHandler:decisionHandler];
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    [super webView:webView didReceiveServerRedirectForProvisionalNavigation:navigation];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    [super webView:webView didFailProvisionalNavigation:navigation withError:error];
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    if (@available(iOS 9.0, *)) {
        [super webViewWebContentProcessDidTerminate:webView];
    } else {
        // Fallback on earlier versions
    }
}

@end
