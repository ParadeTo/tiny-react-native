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

- (instancetype)init:(NSDictionary*)props {
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    if (self) {
        [self update:props];
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
