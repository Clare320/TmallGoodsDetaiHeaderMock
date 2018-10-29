//
//  TouchableTableView.m
//  PassTouch
//
//  Created by kede on 2018/10/29.
//  Copyright © 2018 Clare320. All rights reserved.
//

#import "TouchableTableView.h"

@implementation TouchableTableView

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if(!self.dragging)
//    {
//        [[self nextResponder] touchesBegan:touches withEvent:event];
//    }
//    [super touchesBegan:touches withEvent:event];
//}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if(!self.dragging)
//    {
//        [[self nextResponder] touchesMoved:touches withEvent:event];
//    }
//    [super touchesMoved:touches withEvent:event];
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if(!self.dragging)
//    {
//        [[self nextResponder] touchesEnded:touches withEvent:event];
//    }
//    [super touchesEnded:touches withEvent:event];
//}
//

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.tableHeaderView && CGRectContainsPoint(self.tableHeaderView.frame, point)) {
        return NO;
    }
    return [super pointInside:point withEvent:event];
}


@end
