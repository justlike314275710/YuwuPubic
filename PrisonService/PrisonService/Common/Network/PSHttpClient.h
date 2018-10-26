//
// 名称：PSHttpClient
// 注释：HTTP客户端类
//      所有HTTP请求的基类，提供异步请求，自动重试，缓存等功能
// 作者：william zhao
// 日期：2013-09-30
//

#import "PSParameters.h"

/*!
 *  网络请求方法
 */
typedef NS_ENUM(NSInteger, PSHttpMethod) {
    PSHttpMethodNone = 0,
    PSHttpMethodPost,
    PSHttpMethodGet
};

typedef NS_ENUM(NSInteger, PSTaskType) {
    PSTaskData = 0,         //数据请求
    PSTaskDownload = 1,     //下载
    PSTaskUpload = 2        //上传
};
typedef NS_ENUM(NSInteger, PSPostParameterType) {
    PSPostParameterFormData,
    PSPostParameterJson
};

/*!
 *  线程池优先级
 */
typedef NS_ENUM(NSInteger, PSThreadPoolPriority) {
    PSThreadPoolPriorityDefault = 0,
    PSThreadPoolPriorityHigh,
    PSThreadPoolPriorityLow
};

@interface PSHttpClient : NSObject

/*!
 *  网络请求的方法
 */
@property(nonatomic, assign) PSHttpMethod method;

/*!
 *  网络请求的方法
 */
@property(nonatomic, assign) PSPostParameterType parameterType;

/*!
 *  任务类型，默认为PSTaskData
 */
@property(nonatomic, assign) PSTaskType taskType;

/*!
 *  网络请求的服务器地址
 */
@property(weak, nonatomic, readonly) NSString *serverURL;

/*!
 *  URL拼接参数
 */
@property (strong, nonatomic, readonly) PSParameters *appendParameters;

/*!
 *  网络请求的get参数
 */
@property(strong, nonatomic, readonly) PSParameters *parameters;

/*!
 *  网络请求的post参数
 */
@property(strong, nonatomic, readonly) PSParameters *postParameters;

/*!
 *  网络请求的file参数(文件路径，参数名)，使用此参数集合，需要对应重写：- (NSString *)postFileType方法
 */
@property(strong, nonatomic, readonly) PSParameters *fileParameters;

/*!
 *  网络请求的参数
 */
@property(strong, nonatomic, readonly) PSParameters *headers;

/*!
 *  网络请求超时时间
 */
@property(nonatomic, assign) NSTimeInterval timeOut;

/*!
 *  发送网络请求，调用send方法之后，在release该对象之前，必须先调用cancel方法
 *
 *  @return yes
 */
- (BOOL)send;

/*!
 *  取消网络请求
 */
- (void)cancel;

/*!
 *  构建url拼接参数
 *
 *  @param parameters 可变参数集合类
 */
- (void)buildAppendParameters:(PSMutableParameters*)parameters;

/*!
 *  构建get请求参数
 *
 *  @param parameters 可变参数集合类
 */
- (void)buildParameters:(PSMutableParameters*)parameters;

/**
 *  构建post请求参数
 *
 *  @param parameters 参数集合类
 */
- (void)buildPostParameters:(PSMutableParameters *)parameters;

/**
 *  构建上传文件参数
 *
 *  @param parameters 文件参数集合（参数名+文件路径）
 */
- (void)buildFileParameters:(PSMutableParameters *)parameters;

/*!
 *  构建请求header参数
 *
 *  @param headers 可变参数集合类
 */
- (void)buildHeaders:(PSMutableParameters *)headers;

/*!
 *  重置请求参数
 */
- (void)resetParameters;

/*!
 *  构建请求地址
 *
 *  @return NSURL
 */
- (NSURL*)buildRequestURL;

/**
 *  构建请求地址
 *
 *  @return 地址字符串
 */
- (NSString*)buildRequestURLString;

/*!
 *  网络请求开始
 *
 *  @return NO
 */
- (BOOL)networkStart;

/*!
 *  上传的文件类型，默认上传图片，类型为：image/png
 *
 *  @return nil
 */
- (NSString *)postFileType;

/*!
 *  网络请求完成
 *
 *  @param responseData 返回数据
 */
- (void)networkCompleted:(NSData *)responseData;

/*!
 *  网络请求失败
 *
 *  @param error NSError
 */
- (void)networkError:(NSError *)error;

@end
