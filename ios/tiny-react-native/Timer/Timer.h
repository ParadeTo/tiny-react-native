//
//  Timer.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/6.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
NS_ASSUME_NONNULL_BEGIN

@protocol TimerProtocol <JSExport>

- (void) clearTimeout:(NSString*)timerId;

JSExportAs(setTimeout, - (NSString*) setTimeout:(JSValue *)callback time:(JSValue *)ms);
JSExportAs(setInterval, - (NSString*) setInterval:(JSValue *)callback time:(JSValue *)ms);
@end

@interface Timer : NSObject<TimerProtocol>
+ (void) registerTimerFunc:(JSContext *) jsContext;
- (NSString*) setTimeout:(JSValue *)callback time:(JSValue *)ms;
- (void) clearTimeout:(NSString*)timerId;
- (NSString*) setInterval:(JSValue *)callback time:(JSValue *)ms;
@end

NS_ASSUME_NONNULL_END
