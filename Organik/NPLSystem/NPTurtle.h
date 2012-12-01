//
//  NPTurtle.h
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NPTurtle;

@protocol NPTurtleDelegate <NSObject>
- (void)turtle:(NPTurtle *)turtle performActionForSymbol:(NSString *)symbol;
@end

@interface NPTurtle : NSObject

@property (nonatomic, assign) id<NPTurtleDelegate>delegate;

@property (nonatomic, assign) CGPoint direction;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, retain) NSMutableArray *stack;
@property (nonatomic, retain) UIBezierPath *path;

+ (NPTurtle *)turtleAtPosition:(CGPoint)position direction:(CGPoint)direction;
- (void)resetToPosition:(CGPoint)position direction:(CGPoint)direction;

#pragma mark - Operations
- (void)rotateByDegrees:(CGFloat)angle clockwise:(BOOL)isClockwise;
- (void)moveByUnits:(CGFloat)units;
- (void)pushState;
- (void)popState;
- (void)resetPath;
- (void)tracePathWithSymbols:(NSString *)symbols;

@end
