#import <Foundation/Foundation.h>

@class NPTurtle;

@protocol NPTurtleDelegate <NSObject>
- (void)turtle:(NPTurtle *)turtle performActionForSymbol:(NSString *)symbol;
@end

@interface NPTurtle : NSObject

@property (nonatomic, weak) id<NPTurtleDelegate>delegate;
@property (nonatomic, assign) CGPoint direction;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, strong) NSMutableArray *stack;
@property (nonatomic, strong) UIBezierPath *path;

/* 
 Initialize a new turtle and place it at the given position pointing in the given direction.
 The direction is a CGPoint vector (x,y) with 0,0 origin.  
 e.g. direction = 0,1 will point straight up.
*/
+ (NPTurtle *)turtleAtPosition:(CGPoint)position direction:(CGPoint)direction;

/* 
 Reset the turtle to the given position and pointing in the given direction.
 This also resets the path so this portion won't be included.
*/
- (void)resetToPosition:(CGPoint)position direction:(CGPoint)direction;

#pragma mark - Operations
- (void)rotateByDegrees:(CGFloat)angle clockwise:(BOOL)isClockwise;
- (void)moveByUnits:(CGFloat)units;
- (void)pushState;
- (void)popState;
- (void)resetPath;

/* 
 Traces the turtle's path given the symbols string.
 The turtle will ask the delegate what it should do for each step in the symbols list
*/
- (void)tracePathWithSymbols:(NSString *)symbols;

@end
