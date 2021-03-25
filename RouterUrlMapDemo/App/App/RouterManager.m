//
//  RouterManager.m
//  RouterUrlMapDemo
//
//  Created by 李臣臣 on 2021/3/24.
//

#import "RouterManager.h"

@implementation RouterManager

+ (void)initialize{
    if (!rounterDict) {
        rounterDict = [NSMutableDictionary new];
    }
}

+ (id)handleURL:(NSString *)url {
    NSMutableDictionary *handerDict = rounterDict[url];
    if (!handerDict) {return nil;}
    RouteHander hander = handerDict[RouterHanderKey];
    return hander(nil);
}

+ (nullable id)handleURL:(nonnull NSString *)urlStr
           complexParams:(nullable NSDictionary*)complexParams
              completion:(nullable RouteCompletion)completion {
    
    NSMutableDictionary *handerDict = rounterDict[urlStr];
    if (!handerDict) {return nil;}
    
    RouteHander hander = handerDict[RouterHanderKey];
    id obj = hander(complexParams);
    id (^compeletetionHander) (id obj)  = handerDict[RouterHanderCompeleteKey];
    if (compeletetionHander) {
        completion(compeletetionHander(obj));
    }
    
    return obj;
    
}

+ (void)bindURL:(NSString *)urlStr toHandler:(RouteHander)hander{
    [self bindURL:urlStr toHandler:hander compeleteData:nil];
}

+ (void)bindURL:(NSString *)urlStr toHandler:(RouteHander)hander compeleteData:(nullable id(^)(id sourceObj))completetionHander{
   
    NSMutableDictionary *handerDict = rounterDict[urlStr];
    if (!handerDict) {
        handerDict = [NSMutableDictionary new];
    }
    if (hander) {
        [handerDict setValue:hander forKey:RouterHanderKey];
    }
    
    if (completetionHander) {
        [handerDict setValue:completetionHander forKey:RouterHanderCompeleteKey];
    }
    
    [rounterDict setValue:handerDict forKey:urlStr];
}

@end
