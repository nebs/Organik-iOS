#import <Foundation/Foundation.h>

@interface NPTurtleState : NSObject

@property (nonatomic) CGPoint direction;
@property (nonatomic) CGPoint position;

+ (NPTurtleState *)stateWithDirection:(CGPoint)direction
                             position:(CGPoint)position;

@end
