//
//  ProjectDetailTabBarViewController.m
//  VuforiaTesting
//
//  Created by Michell on 8/3/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "ProjectDetailTabBarViewController.h"
#import "QCARutils.h"
#import "PWParentViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MapsViewController.h"
@implementation ProjectDetailTabBarViewController

-(void)prepareProjectDetail:(NSString *)projectName
{
    _projectName = projectName;
    
    self.title = _projectName;
    
    QCARutils *qUtils = [QCARutils getInstance];
    
    // Path to iPhone App Resources Folder
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    // Path to the project specific Resources Folder
    resourcePath = [NSString stringWithFormat:@"%@/Projects/%@", resourcePath, [projectName stringByReplacingOccurrencesOfString:@" " withString:@"_"]];
    
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
    
    
    
    NSString *models = [NSString stringWithFormat:@"%@/Models", resourcePath];
    directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:models error:&error];
    _modelDict = [[NSMutableDictionary alloc] init];
    
    for(NSString *item in directoryContents) {
        NSString *jsonString = [NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", models, item]
                                                     encoding:NSUTF8StringEncoding error:&error];
        
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *model = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        [_modelDict setObject:model forKey:[item stringByReplacingOccurrencesOfString:@".txt" withString:@""]];
    }
    
    // Load map image into appropriate UIImageView
    NSString *mapImage = [NSString stringWithFormat:@"%@/Map", resourcePath];
    directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:mapImage error:&error];
    MapsViewController *viewController = (MapsViewController *)self.viewControllers[0];
    [viewController initImageArray];
    //viewController.shouldAutorotate = NO;
    for (int i = 0; i < [directoryContents count]; i++) {
        [viewController addObjectToImageArray:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", mapImage, directoryContents[i]]]];
    }
    
    viewController.scrollView.contentSize = CGSizeMake(viewController.scrollView.frame.size.width * [directoryContents count], viewController.scrollView.frame.size.height);


    //Helvetica or Ariel    
    // Load project image into appropriate UIImageView
    NSString *projectImage = [NSString stringWithFormat:@"%@/Picture", resourcePath];
    directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:projectImage error:&error];
    viewController = self.viewControllers[1];
    UIImageView *imgView = (UIImageView *)[viewController.view viewWithTag:100];
    imgView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", projectImage, directoryContents[0]]];
    
    //Load overlays
    NSString *overlayPath = [NSString stringWithFormat:@"%@/Overlays", resourcePath];
    directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:overlayPath error:&error];
    _availableOverlays = [[NSMutableDictionary alloc] init];
    for(NSString *item in directoryContents) {
        [_availableOverlays setObject:[NSString stringWithFormat:@"%@/%@", overlayPath, item] forKey:[item stringByDeletingPathExtension]];
    }
    
    [(PWParentViewController *)self.viewControllers[2] initWithModelDict:_modelDict andOverlays:_availableOverlays];
    self.selectedViewController = self.viewControllers[1];
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
    
    if([self.tabBar respondsToSelector:@selector(setBarTintColor:)]) {
        [[UITabBar appearance] setBackgroundColor:[UIColor clearColor]];
        [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    }
    
    
    self.navigationController.navigationBar.translucent = YES; // Setting this slides the view up, underneath the nav bar (otherwise it'll appear black)
    CGRect rect = self.navigationController.navigationBar.bounds;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [[UIColor colorWithRed:122./255 green:122./255 blue: 122./255 alpha:.7] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    UIGraphicsEndImageContext();
    

	// Do any additional setup after loading the view.

}

- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    
    [moviePlayerController.view removeFromSuperview];
    self.selectedViewController = self.viewControllers[2];
}


-(void)playVideo:(NSURL *)url {
    self.selectedViewController = self.viewControllers[1];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerDidExitFullscreenNotification
                                               object:moviePlayerController];
    
    [moviePlayerController.view setFrame:[self.view bounds]];
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];

}

- (void)viewWillDisappear:(BOOL)animated {

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
