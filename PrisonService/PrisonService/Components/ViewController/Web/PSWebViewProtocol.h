//
//  PSWebViewProtocol.h
//  Start
//
//  Created by calvin on 16/7/19.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

@class UIWebView;

@protocol PSWebViewProtocol <NSObject>

@optional

- (BOOL)stWebView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)stWebViewDidStartLoad:(UIWebView *)webView;
- (void)stWebViewDidFinishLoad:(UIWebView *)webView;
- (void)stWebView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end

