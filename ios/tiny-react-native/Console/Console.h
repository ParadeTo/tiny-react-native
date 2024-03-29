//
//  Console.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/2/2.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
NS_ASSUME_NONNULL_BEGIN

@protocol ConsoleProtocol <JSExport>

- (void) log:(NSString *)msg;

@end

@interface Console : NSObject<ConsoleProtocol>
- (void) log:(NSString *)msg;
@end

NS_ASSUME_NONNULL_END
