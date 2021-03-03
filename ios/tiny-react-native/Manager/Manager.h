//
//  Manager.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/3.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Console.h"
NS_ASSUME_NONNULL_BEGIN

@interface Manager : NSObject
- (Console*) createConsole;
@end

NS_ASSUME_NONNULL_END
