//
//  ViewController.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/2/2.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "ViewController.h"
#import "RNView/RNView.h"
#import "Console.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()
@property(nonatomic, strong, readwrite) JSContext *jsContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:[[RNView alloc] initWithFrame: CGRectMake(50, 50, 100, 100)]];
    
    
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"js"];
//    NSData * jsData = [[NSData alloc]initWithContentsOfFile:path];
//    NSString * jsCode = [[NSString alloc]initWithData:jsData encoding:NSUTF8StringEncoding];
    self.jsContext = [[JSContext alloc]init];
//    NSString *jsCode = @"function hi(){ return 'hi' }; hi()";
    JSValue *value1 = [self.jsContext evaluateScript:@"function hi(){ return 'hi' }; hi()"];
    NSLog([value1 toString]);
    JSValue *value2 = [self.jsContext evaluateScript:@"(function() { return 'hello objc' })"];
    NSLog([[value2 callWithArguments:nil] toString]);
    Console *c = [[Console alloc] init];
    self.jsContext[@"myconsole"] = c;
    JSValue *value3 = [self.jsContext evaluateScript:@"myconsole.log('i am log')"];
    NSLog([value3 toString]);
}


@end
