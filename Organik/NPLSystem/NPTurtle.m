//
//  NPTurtle.m
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import "NPTurtle.h"

#define deg2rad(degrees) degrees * M_PI / 180.0f

const NSString *kDirectionKey = @"direction";
const NSString *kPositionKey = @"position";

@implementation NPTurtle

- (id)init {
    self = [super init];
    if (self) {
        self.position = CGPointZero;
        self.direction = CGPointZero;
        self.stack = [NSMutableArray array];
        self.delegate = nil;
        
        [self resetPath];
    }
    return self;
}

- (void)dealloc {
    [_stack release];
    [_path release];
    
    [super dealloc];
}

+ (NPTurtle *)turtleAtPosition:(CGPoint)position direction:(CGPoint)direction {
    NPTurtle *turtle = [[NPTurtle alloc] init];
    turtle.position = position;
    turtle.direction = direction;
    
    [turtle.path moveToPoint:turtle.position];
    
    return [turtle autorelease];
}

- (void)resetToPosition:(CGPoint)position direction:(CGPoint)direction {
    [self resetPath];
    [self setPosition:position];
    [self setDirection:direction];
    [self.path moveToPoint:self.position];
}

#pragma mark - Operations
- (void)rotateByDegrees:(CGFloat)angle clockwise:(BOOL)isClockwise {
    // If counter-clockwise, adjust accordingly
    if (!isClockwise) {
        angle = 360.0f - angle;
    }
    
    CGFloat radAngle = deg2rad(angle);
    CGPoint newDirection = CGPointZero;
    
    newDirection.x = self.direction.x * cos(radAngle) - self.direction.y * sin(radAngle);
    newDirection.y = self.direction.x * sin(radAngle) + self.direction.y * cos(radAngle);
    
    self.direction = newDirection;
}
- (void)moveByUnits:(CGFloat)units {
    CGPoint newPosition = self.position;
    
    newPosition.x += self.direction.x * units;
    newPosition.y += self.direction.y * units;
    
    self.position = newPosition;

    [self.path addLineToPoint:self.position];
}
- (void)pushState {
    NSValue *storedDirection = [NSValue valueWithCGPoint:self.direction];
    NSValue *storedPosition = [NSValue valueWithCGPoint:self.position];
    
    NSDictionary *storedState = [NSDictionary dictionaryWithObjectsAndKeys:storedDirection, kDirectionKey, storedPosition, kPositionKey, nil];
    [self.stack addObject:storedState];
}
- (void)popState {
    // Get the last element in the stack
    NSDictionary *storedState = [self.stack lastObject];
    
    if (!storedState) {
        return;
    }
    
    // Restore this turtle's properties
    NSValue *storedDirection = [storedState objectForKey:kDirectionKey];
    NSValue *storedPosition = [storedState objectForKey:kPositionKey];
    self.direction = [storedDirection CGPointValue];
    self.position = [storedPosition CGPointValue];
    
    [self.path moveToPoint:self.position];
    
    // Remove the element from the stack
    [self.stack removeLastObject];
}

- (void)resetPath {
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:self.position];    
}

- (void)tracePathWithSymbols:(NSString *)symbols {
    // Go through each symbol and ask the delegate what to do.
    NSUInteger length = [symbols length];
    unichar buffer[length];
    [symbols getCharacters:buffer range:NSMakeRange(0, length)];
    
    for (NSUInteger i = 0; i < length; i++) {
        NSString *symbol = [NSString stringWithFormat:@"%c",buffer[i]];
        
        // Tell the delegate to perform an action for this symbol
        if ([self.delegate respondsToSelector:@selector(turtle:performActionForSymbol:)]) {
            [self.delegate turtle:self performActionForSymbol:symbol];
        }
    }
}


@end
