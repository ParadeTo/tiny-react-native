//
//  RNText.m
//  tiny-react-native
//
//  Created by You Xingzhi on 2021/4/25.
//  Copyright © 2021 youxingzhi. All rights reserved.
//

#import "RNText.h"

@implementation RNText
- (instancetype)init:(NSDictionary*)props; {
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
    NSString* children = [props objectForKey:@"children"];
    NSString* fontSize = [props objectForKey:@"fontSize"];
    self.frame = CGRectMake([x floatValue], [y floatValue], [w floatValue], [h floatValue]);
    self.textColor = [UIColor colorWithRed:[r floatValue] green:[g floatValue] blue:[b floatValue] alpha:[a floatValue]];
    self.font =[UIFont systemFontOfSize:[fontSize floatValue]];
    self.text = children;
    [self sizeToFit];
}
@end
