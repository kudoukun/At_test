//
//  DragView.m
//  eigodePon
//
//  Created by 酒井 邦也 on 12/07/03.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "DragView.h"

@implementation DragView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    startLocation = [[touches anyObject] locationInView:self];
    [[self superview ]bringSubviewToFront:self];
     
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint pt = [[touches anyObject] locationInView:self];
    CGRect frame = [self frame];
    frame.origin.x += pt.x -startLocation.x;
    //frame.origin.y += pt.y -startLocation.y;
    [self setFrame:frame]; 
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint pt = [[touches anyObject] locationInView:self];
    NSValue *val = [NSValue valueWithCGPoint:pt];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:val forKey:@"Point"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toSort" object:self userInfo:dic];
    
    
    
}

@end
