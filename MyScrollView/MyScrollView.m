//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Erin Luu on 2016-11-14.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "MyScrollView.h"



@implementation MyScrollView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    if (self.yellowBox) {
        CGFloat maxHeight = self.yellowBox.frame.origin.y + self.yellowBox.frame.size.height;
        self.maxContentHeight = maxHeight;
    }
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender translationInView:self];
    float maxScrollableHeight =  (750 - self.frame.size.height) * -1;
    CGFloat newYPoint =  self.frame.origin.y + point.y;
    
    if ((newYPoint > maxScrollableHeight) && (newYPoint <= 0) ) {
        CGRect newRect = CGRectMake(self.frame.origin.x, newYPoint, self.frame.size.width, self.frame.size.height);
        self.frame = newRect;
    }
}

@end
