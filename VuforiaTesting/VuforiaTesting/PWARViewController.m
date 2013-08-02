//
//  PWARViewController.m
//  VuforiaTesting
//
//  Created by Michell on 8/1/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "PWARViewController.h"

@interface PWARViewController ()

@end

@implementation PWARViewController

- (void) targetFound:(NSString *)target
{
    [self.targetFoundDelegate targetFound:target];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arView.targetFoundDelegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
