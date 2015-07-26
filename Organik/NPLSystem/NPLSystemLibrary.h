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