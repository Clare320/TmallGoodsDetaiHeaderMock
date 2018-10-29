//
//  TouchableScrollView.m
//  PassTouch
//
//  Created by kede on 2018/10/29.
//  Copyright © 2018 Clare320. All rights reserved.
//

#import "TouchableScrollView.h"

@implementation TouchableScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"---> scrollView touchBegan");
}

@end
