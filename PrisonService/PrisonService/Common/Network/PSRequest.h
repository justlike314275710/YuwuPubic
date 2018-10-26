//
// 名称：PSRequest
// 注释：接口请求基类
//      提供所有网络请求接口的基类
// 作者：william zhao
// 日期：2013-09-30
//

#import "PSHttpClient.h"
#import "PSResponse.h"
#import "PSRequestDelegate.h"
#import <UIKit/UIDevice.h>

typedef NS_ENUM(NSInteger,PSPlatform) {
    PSPlatformIOS = 1,  //IOS平台
    PSPlatformWeb = 2   //Web
};

/*!
 *  网络请求抽象类
 */
@interface PSRequest : PSHttpClient

/*!
 *  网络请求的服务名称
 */
@property(nonatomic, strong) NSString *serviceName;

/*!
 *  网络请求的回调委托
 */
@property(nonatomic, weak) id <PSRequestDelegate> delegate;

/*!
 *  网络请求的响应类
 */
- (Class)responseClass;

/*!
 *  使用Block方式发送网络请求
 *
 *  @param completedCallback PSRequestCompletedCallback
 */
- (void)send:(PSRequestCompletedCallback)completedCallback;

/*!
 *  使用Block方式发送网络请求
 *
 *  @param completedCallback PSRequestCompletedCallback
 *  @param errorCallback     PSRequestErrorCallback
 */
- (void)send:(PSRequestCompletedCallback)completedCallback errorCallback:(PSRequestErrorCallback)errorCallback;

/*!
 *  取消网络请求
 */
- (void)cancelRequest;

/**
 *  业务相关的拼接
 *
 *  @return 业务相关的拼接
 */
- (NSString *)businessDomain;

@end
