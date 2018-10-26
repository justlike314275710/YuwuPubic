//
// 名称：PSParameters
// 注释：参数类
//      提供参数管理，参数签名等功能
// 作者：william zhao
// 日期：2013-09-30
//


#import <Foundation/Foundation.h>

/*!
 *  参数集合类
 */
@interface PSParameters : NSObject {
@protected
    NSMutableDictionary *_dictionary;

}
//初始化参数集合
/*!
 *  初始化参数集合
 *
 *  @param parameters parameters
 *
 *  @return self
 */
- (id)initWithParameters:(NSString *)parameters;

/*!
 *  将参数按字典排序后拼接成字符串
 *
 *  @return NSString
 */
- (NSString *)sortedString;

/*!
 *  构建参数集合为字符串
 *
 *  @return NSString
 */
- (NSString *)buildParameters;

/*!
 *  获取参数集合的字典
 *
 *  @return NSDictionary
 */
- (NSDictionary*)dictionary;

/*!
 *  参数总数
 *
 *  @return NSInteger
 */
- (NSInteger)count;

/*!
 *  比较参数是否一致
 *
 *  @param parameters parameters
 *
 *  @return bool
 */
- (BOOL)isEqualToParameters:(NSString *)parameters;
@end

/*!
 *  可变参数集合类
 */
@interface PSMutableParameters : PSParameters {
}
/*!
 *  新增一个参数
 *
 *  @param value value
 *  @param key   key
 */
- (void)addParameter:(id)value forKey:(NSString *)key;

/*!
 *  移除一个参数
 *
 *  @param key key
 */
- (void)removeParameter:(NSString *)key;

/*!
 *  清空参数集合
 */
- (void)clearAllParameter;

/*!
 *  获取一个参数
 *
 *  @param key key
 *
 *  @return value
 */
-(id)getParameter:(NSString *)key;

@end
