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
    perkins.layer.borderColor = [[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.4] CGColor];
    

    //To make the border look very close to a UITextField
    [perkins.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [perkins.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    perkins.layer.cornerRadius = 5;
    perkins.clipsToBounds = YES;
    
    michell.layer.borderWidth = 5.0f;
    michell.layer.borderColor = [[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.4] CGColor];
    
    //To make the border look very close to a UITextField
    [michell.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [michell.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    michell.layer.cornerRadius = 5;
    michell.clipsToBounds = YES;
	// Do any additional setup after loading the view.
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor blackColor]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"About Us", @"");
    [label sizeToFit];
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
