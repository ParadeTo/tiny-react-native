//
//  FileLoader.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/16.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "FileLoader.h"

@implementation FileLoader
- (void)loadListDataWithFinishBlock:(LoadedJsFileFinishBlock)finishBlock {
    NSString *urlString = @"http";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session =  [NSURLSession sharedSession];
}
@end
