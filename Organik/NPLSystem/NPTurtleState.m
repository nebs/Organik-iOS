#import "NPTurtleState.h"

@implementation NPTurtleState

+ (NPTurtleState *)stateWithDirection:(CGPoint)direction position:(CGPoint)position {
    NPTurtleState *state = [NPTurtleState new];
    state.position = position;
    state.direction = direction;
    return state;
}

@end
