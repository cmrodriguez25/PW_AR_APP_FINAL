//
//  PWNavController.m
//  VuforiaTesting
//
//  Created by Michell on 9/3/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "PWNavController.h"
#import "PWParentViewController.h"
#import "ProjectDetailTabBarViewController.h"

@interface PWNavController ()

@end

@implementation PWNavController

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
	// Do any additional setup after loading the view.
} 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotate {
    if([self.visibleViewController isKindOfClass:[ProjectDetailTabBarViewController class]]) {
        ProjectDetailTabBarViewController *vc = (ProjectDetailTabBarViewController*)self.visibleViewController;
        return [vc.selectedViewController isKindOfClass:[PWParentViewController class]];
    }
    return NO;
}

@end
