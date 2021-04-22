//
//  RNView.h
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/2/2.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNView : UIView
- (void) update:(NSDictionary*)props;
- (instancetype)initWithFrame:(CGRect)frame red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
