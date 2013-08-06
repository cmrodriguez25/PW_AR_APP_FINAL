//
//  ProjectDetailTabBarViewController.m
//  VuforiaTesting
//
//  Created by Michell on 8/3/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "ProjectDetailTabBarViewController.h"
#import "QCARutils.h"


@implementation ProjectDetailTabBarViewController

-(void)prepareProjectDetail:(NSString *)projectName
{
    _projectName = projectName;
    
    self.title = _projectName;
    QCARutils *qUtils = [QCARutils getInstance];
    
    // Path to iPhone App Resources Folder
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    // Path to the project specific Resources Folder
    resourcePath = [NSString stringWithFormat:@"%@/Projects/%@", resourcePath, projectName];
    
    // First, get list of all targets needed for this project. These will be used
    // by Vuforia to place models.
    NSString *targets = [NSString stringWithFormat:@"%@/%@", resourcePath, @"Targets"];
    NSError *error;
    NSArray *directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:targets error:&error];
    
    // For each xml target file in this directory, call Vuforia's "addTarget" method
    for (NSString *item in directoryContents) {
        if([item rangeOfString:@".xml"].location != NSNotFound) {
            [qUtils addTargetName:[item stringByReplacingOccurrencesOfString:@".xml" withString:@""]
                           atPath:[NSString stringWithFormat:@"%@/%@", targets, item]];
        }
    }
    
    // Load map image into appropriate UIImageView
    NSString *mapImage = [NSString stringWithFormat:@"%@/Map", resourcePath];
    directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:mapImage error:&error];
    UIViewController *viewController = self.viewControllers[0];
    UIImageView *imgView = (UIImageView *)[viewController.view viewWithTag:100];
    imgView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", mapImage, directoryContents[0]]];
    
    // Load project image into appropriate UIImageView
    NSString *projectImage = [NSString stringWithFormat:@"%@/Picture", resourcePath];
    directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:projectImage error:&error];
    viewController = self.viewControllers[1];
    imgView = (UIImageView *)[viewController.view viewWithTag:100];
    imgView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", projectImage, directoryContents[0]]];
    
    
}

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
    
    // DELETE: This is for testing purposes only.
    // prepareProjectDetail should be called by MainMenuViewController
    // with the project name once the user selects the correct project.
    [self prepareProjectDetail:@"Project1"];
    
    
    [[UITabBar appearance] setBackgroundColor:[UIColor clearColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
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