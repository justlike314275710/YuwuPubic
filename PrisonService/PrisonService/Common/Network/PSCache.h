//
// 名称：PSCache
// 注释：缓存静态类，包括数据库缓存与文件缓存。
// 作者：william zhao
// 日期：2013-09-30
//

#import <Foundation/Foundation.h>

/*!
 *  缓存类型
 */
typedef enum {
    PSCacheTypeNone = 0,
    PSCacheTypeAPI,
    PSCacheTypeImage,
    PSCacheTypeStartupAd,
    PSCacheTypeStatistics,
    PSCacheTypeTodayLike
} PSCacheType;

/*!
 *  缓存策略
 */
@interface PSCachePolicy : NSObject<NSCopying>

+(instancetype)cachePolicyWithCacheType:(PSCacheType)cacheType;

-(id)initWithCacheType:(PSCacheType)cacheType;

/*!
 *  缓存类型
 */
@property(nonatomic, assign) PSCacheType cacheType;

/*!
 *  失效日期
 */
@property(nonatomic, strong) NSDate* expDate;

/*!
 *  是否使用文件缓存
 */
@property(nonatomic, assign) BOOL useFileCache;

@end

/*!
 *  缓存管理类
 */
@interface PSCache : NSObject

/*!
 *  查询缓存大小
 *
 */
+ (NSInteger)cacheSize;

/*!
 *  查询缓存
 *
 *  @param key key
 *
 *  @return 返回某类型的所有数据。如果缓存不存在或已经失效，返回nil
 */
+ (id)queryCache:(NSString *)key;

/*!
 *  查询缓存，返回某类型的所有数据
 *
 *  @param type PSCacheType-缓存类型
 *
 *  @return 返回某类型的所有数据
 */
+ (NSArray *)queryCacheForType:(PSCacheType)type;

/*!
 *  查询缓存，返回某类型的所有数据
 *
 *  @param type     PSCacheType-缓存类型
 *  @param maxCount 最大返回数量
 *
 *  @return 返回某类型的所有数据
 */
+ (NSArray *)queryCacheForType:(PSCacheType)type maxCount:(NSInteger)maxCount;

/*!
 *  查询某类型数据条数
 *
 *  @param type PSCacheType-缓存类型
 *
 *  @return 某类型数据条数
 */
+ (NSInteger)queryCacheCountForType:(PSCacheType)type;

/*!
 *  缓存数据的路径
 *
 *  @return 缓存数据的路径
 */
+ (NSString *)dbPath;

/*!
 *  清除图片缓存
 *
 *
 */
+ (void)clearCache;

/*!
 *  缓存数据的锁
 *
 *  @return 缓存数据的锁
 */
+ (NSLock *)dbLock;

/*!
 *  添加缓存
 *
 *  @param key key
 *  @param obj object
 */
+ (void)addCache:(NSString *)key obj:(id <NSCoding>)obj;
/*!
 *  添加缓存
 *
 *  @param key    key
 *  @param obj    object
 *  @param policy 缓存策略
 */
+ (void)addCache:(NSString *)key obj:(id <NSCoding>)obj policy:(PSCachePolicy*)policy;
/*!
 *  添加缓存
 *
 *  @param key  key
 *  @param obj  object
 *  @param type PSCacheType-缓存类型
 */
+ (void)addCache:(NSString *)key obj:(id <NSCoding>)obj type:(PSCacheType)type;
/*!
 *  添加缓存
 *
 *  @param key     key
 *  @param obj     object
 *  @param type    PSCacheType-缓存类型
 *  @param expDate 失效日期
 */
+ (void)addCache:(NSString *)key obj:(id <NSCoding>)obj type:(PSCacheType)type expDate:(NSDate *)expDate;

/*!
 *  删除指定key缓存
 *
 *  @param key key
 */
+ (void)removeCacheForKey:(NSString *)key;

/*!
 *  删除指定type缓存
 *
 *  @param type PSCacheType-缓存类型
 */
+ (void)removeCacheForType:(PSCacheType)type;

/*!
 *  删除所有缓存
 */
+ (void)removeAllCache;

@end
