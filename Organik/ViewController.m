//
//  ViewController.m
//  Organik
//
//  Created by Nebojsa Petrovic on 2012-11-11.
//  Copyright (c) 2012 Nebojsa Petrovic. All rights reserved.
//

#import "ViewController.h"
#import "NPLSystemView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NPLSystemView *lsv = [[NPLSystemView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:lsv];
}

@end
