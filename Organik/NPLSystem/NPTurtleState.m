//
//  NPTurtleState.m
//  Organik
//
//  Created by Nebojsa Petrovic on 4/28/13.
//  Copyright (c) 2013 Nebojsa Petrovic. All rights reserved.
//

#import "NPTurtleState.h"

@implementation NPTurtleState

+ (NPTurtleState *)stateWithDirection:(CGPoint)direction position:(CGPoint)position {
    NPTurtleState *state = [NPTurtleState new];
    state.position = position;
    state.direction = direction;
    return state;
}

@end
