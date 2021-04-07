//
//  Bridge.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/21.
//  Copyright © 2021 youxingzhi. All rights reserved.
//
#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
NS_ASSUME_NONNULL_BEGIN

@protocol BridgeProtocol <JSExport>

- (void) send:(NSString *)msg;

@end

@interface Bridge : NSObject<BridgeProtocol>
- (void) send:(NSString *)msg;
- (instancetype) initWithRootViewController:(UIViewController*)rootViewController;
@end

NS_ASSUME_NONNULL_END
