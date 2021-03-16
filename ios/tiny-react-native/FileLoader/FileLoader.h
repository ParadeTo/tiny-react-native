//
//  FileLoader.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/3/16.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^LoadedJsFileFinishBlock)(BOOL success, NSString *path);

@interface FileLoader : NSObject
- (void)loadJsFile:(LoadedJsFileFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
