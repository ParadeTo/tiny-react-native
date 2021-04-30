//
//  Component.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/30.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Component <NSObject>
- (void) update:(NSDictionary*)props;
- (instancetype)init:(NSDictionary*)props;
@end

NS_ASSUME_NONNULL_END
