//
//  Window.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/8.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
NS_ASSUME_NONNULL_BEGIN

@protocol WindowProtocol <JSExport>
@property (nonatomic, copy) NSDictionary *location;
JSExportAs(addEventListener, - (void) addEventListener:(NSString*)event callback:(JSValue *)callback);
@end

@interface Window : NSObject<WindowProtocol>
@property (nonatomic, copy) NSDictionary *location;
- (void) addEventListener:(NSString*)event callback:(JSValue *)callback;
@end

NS_ASSUME_NONNULL_END
