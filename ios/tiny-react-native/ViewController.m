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
#import "Manager.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()
@property(nonatomic, strong, readwrite) JSContext *jsContext;
@end

@implementation ViewController

- (void)addRNView {
    [self.view addSubview:[[RNView alloc] initWithFrame: CGRectMake(50, 50, 100, 100)]];
}

- (Console*) createConsole {
    Console *c = [[Console alloc] init];
    return c;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.jsContext = [[JSContext alloc]init];

    Bridge *b = [[Bridge alloc] initWithRootViewController:self];

    self.jsContext[@"RNBridge"] = b;
    self.jsContext[@"window"] = [[NSObject alloc] init];
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
