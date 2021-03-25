//
//  RouterManager.h
//  RouterUrlMapDemo
//
//  Created by 李臣臣 on 2021/3/24.
//

#import <Foundation/Foundation.h>

#define Router_SecondeVC @"//member/Router_SecondeVC"
#define Router_ViewController @"//member/Router_ViewController"

NS_ASSUME_NONNULL_BEGIN

#define RouterHanderKey @"RouterHanderKey"
#define RouterHanderCompeleteKey @"RouterHanderCompeleteKey"

typedef void (^RouteCompletion) (id data);
typedef id _Nullable (^RouteHander)(NSDictionary * _Nullable parameter);

static NSMutableDictionary *rounterDict = nil;


@interface RouterManager : NSObject

+ (id)handleURL:(NSString *)url;

+ (nullable id)handleURL:(nonnull NSString *)urlStr
           complexParams:(nullable NSDictionary*)complexParams
              completion:(nullable RouteCompletion)completion;

+ (void)bindURL:(NSString *)urlStr
      toHandler:(RouteHander)hander;

+ (void)bindURL:(NSString *)urlStr
      toHandler:(RouteHander)hander
  compeleteData:(nullable id(^)(id sourceObj))completetionHander;


@end



NS_ASSUME_NONNULL_END
