//
//  NPLSystemView.m
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import "NPLSystemView.h"
#import "NPLSystem.h"
#import "NPLSystemLibrary.h"
#import <QuartzCore/QuartzCore.h>

@implementation NPLSystemView {

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        
        // Initialize the delegate
        //self.systemDelegate = [NPLSystemSimpleTree simpleTree];
        self.systemDelegate = [NPLSystemRandomTree randomTree];
        
        // Initialize the L-System with the delegate
        self.lSystem = [NPLSystem systemWithDelegate:self.systemDelegate];
        
        // Initialize the turtle in the center-bottom of the screen
        CGPoint turtleStart = CGPointMake(self.frame.size.width/2.0f, self.frame.size.height);
        self.turtle = [NPTurtle turtleAtPosition:turtleStart direction:CGPointMake(0.0f, -1.0f)];
        [self.turtle setDelegate:self.systemDelegate];
        
        // Reset and animate the turtle
        [self resetTurtle];
        
    }
    return self;
}

- (void)dealloc {
    [_systemDelegate release];
    [_turtle release];
    [_lSystem release];
    
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Clear all sublayers
    for (CALayer *sublayer in self.layer.sublayers) {
        [sublayer removeAllAnimations];
    }
    
    self.layer.sublayers = nil;
}

- (void)animateTurtle:(NPTurtle *)turtle withDuration:(NSTimeInterval)duration {
    // Create a shape layer with the turtle's path
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor randomColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1.0f;
    shapeLayer.path = turtle.path.CGPath;
    shapeLayer.opacity = (CGFloat)(arc4random() % 50 + 50) / 100.0f;
    [self.layer addSublayer:shapeLayer];
    
    // Animate the shape layer 
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [pathAnimation setDelegate:self];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    [self resetTurtle];
}

- (void)resetTurtle {
    // Reset the turtle's start point to a random position
    CGPoint turtleStart = CGPointMake(arc4random() % (int)self.frame.size.width, self.frame.size.height);
    [self.turtle resetToPosition:turtleStart direction:CGPointMake(0.0f, -1.0f)];
    
    // Randomize the number of iterations
    NSUInteger numIterations = arc4random() % 4 + 2;
    CGFloat timePerIteration = 4.0f;
    
    // Randomize a new path and animate it
    NSString *symbols = [self.lSystem symbolsForIteration:numIterations];
    [self.turtle tracePathWithSymbols:symbols];
    [self animateTurtle:self.turtle withDuration:timePerIteration * numIterations];
}


@end
