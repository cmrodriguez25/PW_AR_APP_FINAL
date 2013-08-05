//
//  ProjectDetailTabBarViewController.m
//  VuforiaTesting
//
//  Created by Michell on 8/3/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "ProjectDetailTabBarViewController.h"

@implementation ProjectDetailTabBarViewController


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
    [[UITabBar appearance] setBackgroundColor:[UIColor clearColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    //self.tabBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    //[[UITabBar appearance] setOpaque:NO];
    
	// Do any additional setup after loading the view.

}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
