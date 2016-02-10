//
//  KIProgressView.m
//  Progress
//
//  Created by kaiinui on 2014/09/15.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIProgressView.h"

@implementation KIProgressView

# pragma mark - Initialization

- (void)didMoveToSuperview {
    
    [super didMoveToSuperview];

    //necessary so it doesn't add another animation when moved to superview = nil
    //and to remove the previous animations if they were not finished!
    if (!self.superview) {
        [self.layer removeAllAnimations];
        return;
    }

    if (self.window) {
        [self.layer addAnimation:[self mediumProgressAnimation] forKey:@"animation"];
    }
}

- (CAAnimation *)mediumProgressAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = @(-self.frame.size.width);
    animation.toValue = @(self.frame.size.width * 2);
    animation.duration = 1.2f;
    animation.fillMode = kCAFillModeBoth;
    animation.repeatCount = INFINITY;
    return animation;
}

@end
