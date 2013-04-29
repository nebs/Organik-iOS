//
//  NPLSystemLibrary.m
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import "NPLSystemLibrary.h"

/************************************************
 ***** ABSTRACT BASE CLASS **********************
 ************************************************/
@implementation NPLSystemRepresentation
#pragma mark - NPLSystemDelegate
- (NSString *)lSystem:(NPLSystem *)lSystem ruleForVariableSymbol:(NSString *)symbol {
    return nil;
}
- (NSString *)axiomForLSystem:(NPLSystem *)lSystem {
    return @"";
}
#pragma mark - NPTurtleDelegate
- (void)turtle:(NPTurtle *)turtle performActionForSymbol:(NSString *)symbol {
    
}
@end

/************************************************
 ***** SIMPLE TREE ******************************
 ************************************************/
@implementation NPLSystemSimpleTree

+ (NPLSystemSimpleTree *)simpleTree {
    NPLSystemSimpleTree *simpleTree = [NPLSystemSimpleTree new];
    return simpleTree;
}

#pragma mark - NPLSystemDelegate
- (NSString *)lSystem:(NPLSystem *)lSystem ruleForVariableSymbol:(NSString *)symbol {
    if ([symbol isEqualToString:@"0"]) {
        return @"1[0]0";
    } else if ([symbol isEqualToString:@"1"]) {
        return @"11";
    }
    
    return nil;
}
- (NSString *)axiomForLSystem:(NPLSystem *)lSystem {
    return @"0";
}

#pragma mark - NPTurtleDelegate
- (void)turtle:(NPTurtle *)turtle performActionForSymbol:(NSString *)symbol {
    if ([symbol isEqualToString:@"0"]) {
        [turtle moveByUnits:5.0f];
    }else if ([symbol isEqualToString:@"1"]) {
        [turtle moveByUnits:5.0f];
    }else if ([symbol isEqualToString:@"["]) {
        [turtle pushState];
        [turtle rotateByDegrees:45.0f clockwise:NO];
    }else if ([symbol isEqualToString:@"]"]) {
        [turtle popState];
        [turtle rotateByDegrees:45.0f clockwise:YES];
    }
}

@end

/************************************************
 ***** RANDOM TREE ******************************
 ************************************************/

@implementation NPLSystemRandomTree

+ (NPLSystemRandomTree *)randomTree {
    NPLSystemRandomTree *randomTree = [NPLSystemRandomTree new];
    return randomTree;
}

#pragma mark - NPLSystemDelegate
- (NSString *)lSystem:(NPLSystem *)lSystem ruleForVariableSymbol:(NSString *)symbol {
    if ([symbol isEqualToString:@"F"]) {
        if (arc4random() % 10 > 5) {
            return @"FF-[-F+F+F]+[+F-F-F]";
        }
        return @"F[+F]F[-F]F";
    }
    
    return nil;
}
- (NSString *)axiomForLSystem:(NPLSystem *)lSystem {
    return @"F";
}

#pragma mark - NPTurtleDelegate
- (void)turtle:(NPTurtle *)turtle performActionForSymbol:(NSString *)symbol {
    if ([symbol isEqualToString:@"F"]) {
        [turtle moveByUnits:arc4random() % 5 + 2];
    }else if ([symbol isEqualToString:@"["]) {
        [turtle pushState];
    }else if ([symbol isEqualToString:@"]"]) {
        [turtle popState];
    }else if ([symbol isEqualToString:@"+"]) {
        [turtle rotateByDegrees:arc4random() % 15 + 30 clockwise:YES];
    }else if ([symbol isEqualToString:@"-"]) {
        [turtle rotateByDegrees:arc4random() % 15 + 30 clockwise:NO];
    }
}

@end
