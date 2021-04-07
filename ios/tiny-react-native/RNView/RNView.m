//
//  RNView.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/2/2.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "RNView.h"

@implementation RNView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    return self;
}

@end
