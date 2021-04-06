//
//  Bridge.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/21.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "Bridge.h"
#import "RNView.h"

@implementation Bridge
- (void) send:(NSString *)msg {
     // 序列化 json 字符串
    NSError *jsonError;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:[msg dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&jsonError];
    NSString *operation = [jsonObj objectForKey:@"operation"];

    if (operation == @"createView") {
        NSDictionary *data = [jsonObj objectForKey:@"data"];
        NSString* x = [data objectForKey:@"x"];
        NSString* y = [data objectForKey:@"y"];
        NSString* w = [data objectForKey:@"w"];
        NSString* h = [data objectForKey:@"h"];
        [[RNView alloc] initWithFrame:CGRectMake((NSUInteger)x, (NSUInteger)y, (NSUInteger)w, (NSUInteger)h)];
    }
}
@end
