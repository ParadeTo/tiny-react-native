//
//  Timer.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/6.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "Timer.h"

@interface Timer ()
@property(nonatomic, strong, readwrite) NSDictionary<NSString*, JSValue*> *timerDict;
@property long timerId;
@end

@implementation Timer
- (instancetype) init {
    self = [super init];
    self.timerId = 1;
    return self;
}

+ (void) registerTimerFunc:(JSContext *) jsContext {
    jsContext[@"Timer"] = [[Timer alloc] init];
    NSString *setTimeoutStr =  @"function setTimeout(callback, ms) { return Timer.setTimeout(callback, ms); };";
    NSString *clearTimeoutStr = @"function clearTimeout(id) { Timer.clearTimeout(id); };";
    NSString *setIntervalStr = @"function setInterval(callback, ms) { Timer.setInterval(callback, ms); };";
    NSString *str = [NSString stringWithFormat:@"%@%@%@", setTimeoutStr, clearTimeoutStr, setIntervalStr ];
    [jsContext evaluateScript:str];
}
- (NSString*) setTimeout:(JSValue *)callback time:(JSValue *)ms {
//    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([ms toInt32] * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
         [callback callWithArguments:@[]];
     });
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [callback callWithArguments:nil];
//         __strong typeof(weakSelf) strongSelf = weakSelf;
//        strongSelf.timerDict[self.timerId++] = callback;
//    });
    return @"";
}
- (void) clearTimeout:(NSString*)timerId {
    
}
- (NSString*) setInterval:(JSValue *)callback time:(JSValue *)ms {
    return @"b";
}

@end
