//
//  ViewController.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/2/2.
//  Copyright © 2021 youxingzhi. All rights reserved.
//
#import "RNView.h"
#import "ViewController.h"
#import "RNView/RNView.h"
#import "FileLoader.h"
#import "Console.h"
#import "Bridge.h"
#import "Timer.h"
#import "Window.h"
#import "Person/Person.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()
@property(nonatomic, strong, readwrite) JSContext *jsContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    JSContext *jsCtx = [[JSContext alloc]init];
//    JSValue *value = [jsCtx evaluateScript:@"function hi(){ return 'hi' }; hi()"];
//    NSLog(@"%@", value);

//    jsCtx[@"log"] = ^(NSString *msg){
//        NSLog(@"js:msg:%@",msg);
//    };
//    [jsCtx evaluateScript:@"log('hello,i am js side')"];
    
//    Person *p = [[Person alloc]init];
//    jsCtx[@"person"] = p;
//    JSValue *name = [jsCtx evaluateScript:@"person.whatYouName()"];
//    NSLog(@"%@",name);
//    self.jsContext = [[JSContext alloc]init];

    self.jsContext = [[JSContext alloc]init];
    self.jsContext[@"RNBridge"] = [[Bridge alloc] initWithRootViewController:self];
    self.jsContext[@"window"] = [[Window alloc] init];
    [Timer registerTimerFunc:self.jsContext];

    FileLoader *loader = [[FileLoader alloc] init];
    [loader loadJsFile:^(BOOL success, NSString * _Nonnull code) {
        self.jsContext.exceptionHandler = ^(JSContext *con, JSValue *exception) {
            NSLog(@"%@", exception);
            con.exception = exception;
        };
        JSValue *value3 = [self.jsContext evaluateScript:code];
    }];
}


@end
