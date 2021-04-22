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

- (void) update:(NSDictionary*)props {
    NSString* x = [props objectForKey:@"x"];
    NSString* y = [props objectForKey:@"y"];
    NSString* w = [props objectForKey:@"w"];
    NSString* h = [props objectForKey:@"h"];
    NSString* r = [props objectForKey:@"r"];
    NSString* g = [props objectForKey:@"g"];
    NSString* b = [props objectForKey:@"b"];
    NSString* a = [props objectForKey:@"a"];
    self.frame = CGRectMake([x floatValue], [y floatValue], [w floatValue], [h floatValue]);
    self.backgroundColor = [UIColor colorWithRed:[r floatValue] green:[g floatValue] blue:[b floatValue] alpha:[a floatValue]];
}

@end
