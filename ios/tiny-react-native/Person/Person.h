//
//  Person.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/22.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
NS_ASSUME_NONNULL_BEGIN

// 定义一个协议，可以理解为接口
@protocol JSPersonProtocol <JSExport>
- (NSString *)whatYouName;
@end

// 继承 NSObject，实现 JSPersonProtocol 协议
@interface Person : NSObject<JSPersonProtocol>
@property (nonatomic, copy)NSString *name;
- (NSString *)whatYouName;
@end

NS_ASSUME_NONNULL_END
