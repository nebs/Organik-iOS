#import <UIKit/UIKit.h>
#import "NPTurtle.h"

@class NPLSystemView, NPLSystem, NPLSystemRepresentation;

@interface NPLSystemView : UIView

// The shared delegate for the system and turtle, which is also a representation of a given L-System
@property (nonatomic, strong) NPLSystemRepresentation *systemDelegate;

// The L-System
@property (nonatomic, strong) NPLSystem *lSystem;

// The turtle
@property (nonatomic, strong) NPTurtle *turtle;

@end
