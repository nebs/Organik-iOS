//
//  NPLSystemLibrary.h
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NPLSystem.h"
#import "NPTurtle.h"

// Abstract base class for all L-System representation
@interface NPLSystemRepresentation : NSObject <NPLSystemDelegate, NPTurtleDelegate>
@end

@interface NPLSystemSimpleTree : NPLSystemRepresentation
+ (NPLSystemSimpleTree *)simpleTree;
@end

@interface NPLSystemRandomTree : NPLSystemRepresentation
+ (NPLSystemRandomTree *)randomTree;
@end