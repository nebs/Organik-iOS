//
//  NPLSystem.h
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NPLSystem;

@protocol NPLSystemDelegate <NSObject>
- (NSString *)lSystem:(NPLSystem *)lSystem ruleForVariableSymbol:(NSString *)symbol;
- (NSString *)axiomForLSystem:(NPLSystem *)lSystem;
@end

@interface NPLSystem : NSObject

@property (nonatomic, assign) id<NPLSystemDelegate>delegate;

@property (nonatomic, copy) NSString *axiom;

// Holds all the symbol iteration results
@property (nonatomic, retain) NSMutableArray *symbolIterations;

+ (NPLSystem *)systemWithDelegate:(id<NPLSystemDelegate>)delegate;

// Step through one iteration
- (void)step;

// Step through numSteps number of steps from the current iteration
- (void)stepThrough:(NSUInteger)numSteps;

// Returns the symbols string for the given iteration (and computes the iteration if needed)
- (NSString *)symbolsForIteration:(NSUInteger)index;

@end
