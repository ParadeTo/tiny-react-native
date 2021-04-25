//
//  RNText.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/25.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface RNText : UILabel
- (void) update:(NSDictionary*)props;
- (instancetype)init:(NSDictionary*)props;
@end

NS_ASSUME_NONNULL_END
