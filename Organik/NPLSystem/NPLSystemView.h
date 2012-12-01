//
//  NPLSystemView.h
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPTurtle.h"

@class NPLSystemView, NPLSystem, NPLSystemRepresentation;

@interface NPLSystemView : UIView

@property (nonatomic, retain) NPLSystemRepresentation *systemDelegate;
@property (nonatomic, retain) NPLSystem *lSystem;
@property (nonatomic, retain) NPTurtle *turtle;

@end
