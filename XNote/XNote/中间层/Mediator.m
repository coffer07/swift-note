////
////  Mediator.m
////  XNote
////
////  Created by 高翔 on 17/1/24.
////  Copyright © 2017年 高翔. All rights reserved.
////
//
//#import "Mediator.h"
//#import <objc/runtime.h>
//
//@interface Mediator ()
//
//@property (nonatomic, strong) NSMutableDictionary *cachedTarget;
//
//@end
//
//@implementation Mediator
//
//- (NSMutableDictionary *)cachedTarget
//{
//    if (_cachedTarget == nil) {
//        _cachedTarget = [[NSMutableDictionary alloc] init];
//    }
//    return _cachedTarget;
//}
//
//+ (instancetype)sharedInstance
//{
//    static Mediator *mediator;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        mediator = [[Mediator alloc] init];
//    });
//    return mediator;
//}
//
//- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget isClassMethod:(BOOL) isClassMethod
//{
//    
//    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
//    NSString *actionString = [NSString stringWithFormat:@"Action_%@:", actionName];
//    Class targetClass;
//    
//    NSObject *target = self.cachedTarget[targetName];
//    if (target == nil) {
//        targetClass = NSClassFromString(targetClassString);
//        target = [[targetClass alloc] init];
//    }
//    SEL action = NSSelectorFromString(actionString);
//    
//    if (target == nil) {
//        // 有可能target是Swift对象
//        NSString *projectName = [[[NSBundle mainBundle] init] objectForInfoDictionaryKey:(NSString *)kCFBundleExecutableKey];
//        targetClassString = [NSString stringWithFormat:@"%@.%@",projectName,targetName];
//        targetClass = NSClassFromString(targetClassString);
//        target = [[targetClass alloc] init];
//        if (target == nil) {
//            return nil;
//        }
//    }
//    
//    if (shouldCacheTarget) {
//        self.cachedTarget[targetName] = target;
//    }
//    
//    if ([target respondsToSelector:action]) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//        return [target performSelector:action withObject:params];
//#pragma clang diagnostic pop
//    } else {
//        // 有可能target是Swift对象
//        actionString = [NSString stringWithFormat:@"%@", actionName];
//        action = NSSelectorFromString(actionString);
//        if ([target respondsToSelector:action]) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//            return [target performSelector:action withObject:params];
//#pragma clang diagnostic pop
//        } else {
//            // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
//            SEL action = NSSelectorFromString(@"notFound:");
//            if ([target respondsToSelector:action]) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//                return [target performSelector:action withObject:params];
//#pragma clang diagnostic pop
//            } else {
//                [self.cachedTarget removeObjectForKey:targetName];
//                return nil;
//            }
//        }
//    }
//}
//
//- (void)releaseCachedTargetWithTargetName:(NSString *)targetName
//{
//    [self.cachedTarget removeObjectForKey:targetName];
//}
//
//
//@end
