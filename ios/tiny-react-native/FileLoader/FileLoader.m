//
//  FileLoader.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/16.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "FileLoader.h"

@implementation FileLoader
- (void)loadJsFile:(LoadedJsFileFinishBlock)finishBlock {
//    NSString *urlString = @"http://localhost:3000/static/js/bundle.js";
    NSString *urlString = @"http://localhost:5000/static/js/main.4228be85.js";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session =  [NSURLSession sharedSession];

    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *code = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        finishBlock(error == nil, code);
    }];
    [dataTask resume];
}
@end
