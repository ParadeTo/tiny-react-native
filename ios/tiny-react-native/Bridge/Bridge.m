//
//  Bridge.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/21.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "Bridge.h"
#import "RNView.h"
#import "RNText.h"
#import "AppDelegate.h"

@interface Bridge ()
@property(nonatomic, strong, readwrite) NSMutableDictionary<NSString *,id>* eleDict;
@property UIViewController* rootViewController;
@end


@implementation Bridge
- (instancetype) initWithRootViewController:(UIViewController*)rootViewController {
    self = [super init];
    if (self) {
        self.eleDict = [[NSMutableDictionary alloc] init];
        self.rootViewController = rootViewController;
    }
    return self;
}
- (void) send:(NSString *)msg {
     // 序列化 json 字符串
    NSError *jsonError;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:[msg dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&jsonError];
    NSString *operation = [jsonObj objectForKey:@"operation"];

    if ([operation isEqualToString:@"createText"]) {
        NSDictionary *props = [jsonObj objectForKey:@"props"];
        NSString* _id = [jsonObj objectForKey:@"id"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.eleDict setObject:[[RNText alloc] init:props] forKey:_id];
        });
    } else if ([operation isEqualToString:@"createView"]) {
        NSDictionary *props = [jsonObj objectForKey:@"props"];
        NSString* _id = [jsonObj objectForKey:@"id"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.eleDict setObject:[[RNView alloc] init:props] forKey:_id];
        });
    } else if ([operation isEqualToString:@"createRoot"]) {
        __weak typeof(self) weakSelf = self;
        // 放到任务队列中才能修改 UI
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.eleDict setObject:[[NSObject alloc] init] forKey:@"root"];
        });
    } else if ([operation isEqualToString:@"appendChild"]) {
        NSString* parent = [jsonObj objectForKey:@"parent"];
        NSString* child = [jsonObj objectForKey:@"child"];
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if ([parent isEqualToString:@"root"]) {
                RNView* childEle = (RNView *)[self.eleDict valueForKey:child];
                [self.rootViewController.view addSubview:childEle];
            } else {
                RNView* parentEle = (RNView *)[self.eleDict valueForKey:parent];
                RNText* childEle = (RNText *)[self.eleDict valueForKey:child];
                [parentEle addSubview:childEle];
            }
        });
    } else if ([operation isEqualToString:@"update"]) {
        NSString* instance = [jsonObj objectForKey:@"instance"];
        NSDictionary* props = [jsonObj objectForKey:@"props"];
        RNView* ele = (RNView *)[self.eleDict valueForKey:instance];
        [ele update:props];
        NSLog(@"%@", ele);
    }
}
@end
