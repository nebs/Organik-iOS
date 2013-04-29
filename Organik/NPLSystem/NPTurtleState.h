//
//  NPTurtleState.h
//  Organik
//
//  Created by Nebojsa Petrovic on 4/28/13.
//  Copyright (c) 2013 Nebojsa Petrovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NPTurtleState : NSObject

@property (nonatomic) CGPoint direction;
@property (nonatomic) CGPoint position;

+ (NPTurtleState *)stateWithDirection:(CGPoint)direction
                             position:(CGPoint)position;

@end
