//
//  NPLSystem.m
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import "NPLSystem.h"

@implementation NPLSystem

- (id)init {
    self = [super init];
    if (self) {
        self.axiom = @"";
    }
    return self;
}


+ (NPLSystem *)systemWithDelegate:(id<NPLSystemDelegate>)delegate {
    NPLSystem *system = [[NPLSystem alloc] init];
    [system setDelegate:delegate];
    
    // Ask the delegate for the axiom
    if ([system.delegate respondsToSelector:@selector(axiomForLSystem:)]) {
        system.axiom = [system.delegate axiomForLSystem:system];
    }
    
    return system;
}

- (void)setAxiom:(NSString *)axiom {
    if (_axiom) {
        _axiom = nil;
    }
    
    _axiom = [axiom copy];
    
    // Clear the iterations and add this axiom as the first iteration
    if (self.symbolIterations) {
        [self.symbolIterations removeAllObjects];
        self.symbolIterations = nil;
    }
    
    self.symbolIterations = [NSMutableArray array];
    [self.symbolIterations addObject:_axiom];
}

- (NSString *)symbolsByProcessingRulesOnSymbols:(NSString *)symbols {
    // Hold the new iteration string
    NSMutableString *newIteration = [NSMutableString string];
    
    NSUInteger length = [symbols length];
    unichar buffer[length];
    [symbols getCharacters:buffer range:NSMakeRange(0, length)];
    
    for (NSUInteger i = 0; i < length; i++) {
        NSString *symbol = [NSString stringWithFormat:@"%c",buffer[i]];
        
        NSString *replacementSymbol = nil;
        
        // Ask the delegate for the new symbol
        if ([self.delegate respondsToSelector:@selector(lSystem:ruleForVariableSymbol:)]) {
            replacementSymbol = [self.delegate lSystem:self ruleForVariableSymbol:symbol];
        }
        
        // If this symbol is a constant, then don't replace it.
        if (!replacementSymbol) {
            replacementSymbol = symbol;
        }
             
        [newIteration appendString:replacementSymbol];
    }
    
    return newIteration;
}

- (NSString *)symbolsForIteration:(NSUInteger)index {
    // If we don't have this iteration, calculate it
    if (index >= [self.symbolIterations count]) {
        NSUInteger iterationDelta = index - ([self.symbolIterations count] - 1);
        [self stepThrough:iterationDelta];
    }
    
    return [self.symbolIterations objectAtIndex:index];
}

- (void)step {
    // If we have no iterations, do nothing
    if (!self.symbolIterations || [self.symbolIterations count] <= 0) {
        return;
    }
    
    // Get the last iteration
    NSString *lastIteration = [self.symbolIterations objectAtIndex:[self.symbolIterations count] - 1];
    
    // Process the rules
    NSString *newIteration = [self symbolsByProcessingRulesOnSymbols:lastIteration];
    
    // Add the new iteration
    [self.symbolIterations addObject:newIteration];
}

- (void)stepThrough:(NSUInteger)numSteps {
    for (int i=0; i<numSteps; i++) {
        [self step];
    }
}


@end
