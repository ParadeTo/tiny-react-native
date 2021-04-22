//
//  Window.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/8.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "Window.h"

@implementation Window
- (instancetype) init {
    self = [super init];
    self.location = [[NSDictionary alloc] init];
    return self;
}
- (void) addEventListener:(NSString*)event callback:(JSValue *)callback {
    
}
@end
