//
//  PSStandardWebViewController.h
//  Start
//
//  Created by calvin on 16/7/24.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import "PSBaseWebViewController.h"
#import "WKWebViewJavascriptBridge.h"

@interface PSStandardWebViewController : PSBaseWebViewController

@property (nonatomic, strong, readonly) WKWebViewJavascriptBridge *bridge;

@end
