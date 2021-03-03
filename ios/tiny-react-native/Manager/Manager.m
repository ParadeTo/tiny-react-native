//
//  Manager.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/3.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "Manager.h"
#import "Console.h"
@implementation Manager
- (Console*) createConsole {
    NSLog(@"create console");
    return [[Console alloc] init];
}
@end
