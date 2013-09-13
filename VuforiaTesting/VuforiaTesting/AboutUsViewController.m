//
//  AboutUsViewController.m
//  VuforiaTesting
//
//  Created by cynthia besada on 8/6/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "AboutUsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController
@synthesize perkins, michell;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"About Us";
    perkins.layer.borderWidth = 5.0f;
    perkins.layer.borderColor = [[UIColor greenColor] CGColor];
    
    michell.layer.borderWidth = 5.0f;
    michell.layer.borderColor = [[UIColor greenColor] CGColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [perkins release];
    [michell release];
    [super dealloc];
}
@end
