//
//  SecondViewController.m
//  VuforiaTesting
//
//  Created by Michell on 7/30/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "PWParentViewController.h"
#import "PWARViewController.h"
#import "QCARutils.h"
#import <MediaPlayer/MediaPlayer.h>
#import "ProjectDetailTabBarViewController.h"
#import <QuartzCore/QuartzCore.h>

extern bool isInterfaceOrientationPortrait;
@implementation PWParentViewController
bool videoPlayed = false;


-(void)targetFound:(NSString *)target
{
    if([_overlayDict objectForKey:target] != nil) {
        [HUDVC showOverlay:[_overlayDict objectForKey:target]];
    }
    
    if([target isEqualToString:@"Stair1Floor"]) {
        ProjectDetailTabBarViewController *pvc = (ProjectDetailTabBarViewController*)self.parentViewController;
        
        NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"isisvideo" ofType:@"m4v"];
        [pvc playVideo:[NSURL fileURLWithPath:filepath]];
    }
    
    [HUDVC displayText:target];
}

-(void)targetLost {
    [HUDVC hideOverlay];
}

-(id)initWithModelDict:(NSMutableDictionary *)modelDict andOverlays:(NSMutableDictionary *)overlayDict
{
    self = [super init];
    if (self) {
        _modelDict = modelDict;
        _overlayDict = overlayDict;
    }
    
    return self;
}

-(void)loadView
{
    NSLog(@"ImageTargetsParentViewController: creating");
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    window = [[UIWindow alloc] initWithFrame: screenBounds];
    [self initWithWindow:window];
    
    [self createParentViewAndSplashContinuation];
    
    // Add the EAGLView
    arViewController = [[PWARViewController alloc] initWithModelDict:_modelDict];
    arViewController.targetFoundDelegate = self;
    
    
    // need to set size here to setup camera image size for AR
    arViewController.arViewSize = arViewRect.size;
    [parentView addSubview:arViewController.view];
    
    // Load the HUD View Controller from StoryBoard file
    
    HUDVC = (HUDViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"HUDVC"];
    
    
    // Not sure if needed...
    [HUDVC retain];
    
    
    // Set the background of the HUD View to Alpha = 0 so that Camera Feed
    // still shows up under
    HUDVC.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    
    // Add the HUD View
    [parentView addSubview: HUDVC.view];
    
    self.view = parentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"DomParentVC: loading");
    // it's important to do this from here as arViewController has the wrong idea of orientation
    [self handleARViewRotation:self.interfaceOrientation];
    // we also have to set the overlay view to the correct width/height for the orientation
    [overlayViewController handleViewRotation:self.interfaceOrientation];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Splash screen control
- (void)endSplash:(NSTimer*)theTimer
{
    // Poll to see if the camera video stream has started and if so remove the
    // splash screen
    [super endSplash:theTimer];

}

- (void) handleARViewRotation:(UIInterfaceOrientation)interfaceOrientation
{
    CGPoint centre, pos;
    NSInteger rot;
    
    // Set the EAGLView's position (its centre) to be the centre of the window, based on orientation
    centre.x = arViewController.arViewSize.width / 2;
    centre.y = arViewController.arViewSize.height / 2;
    
    BOOL largeScreen = NO ;
    
    if (self.view.frame.size.height > 480) {
        // iPad and iPhone5
        largeScreen = YES;
    }
    
    int yOffset = 200;
    if (YES == largeScreen)
        yOffset = 300;
    

    CGRect viewBounds;
    viewBounds.origin.x = 0;
    viewBounds.origin.y = 0;
    
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            NSLog(@"DomParentVC: Rotating to Landscape Left");
            rot = 180;
        }
        else
        {
            NSLog(@"DomParentVC: Rotating to Landscape Right");
            rot=0;
        }
        
        isInterfaceOrientationPortrait= false;
        pos.x = centre.y;
        pos.y = centre.x;
  
        viewBounds.size.width = arViewController.arViewSize.height;
        viewBounds.size.height = arViewController.arViewSize.width;
        
    }
    else
    {
        if (interfaceOrientation == UIInterfaceOrientationPortrait)
        {
            NSLog(@"DomParentVC: Rotating to Portrait");
            rot = 90;
        }
        else
        {
            NSLog(@"DomParentVC: Rotating to Upside Down");
            rot = 270;
        }
        isInterfaceOrientationPortrait= true;
        pos = centre;

        viewBounds.size.width = arViewController.arViewSize.width;
        viewBounds.size.height = arViewController.arViewSize.height;
        
    }
    [HUDVC.view setFrame:viewBounds];
    arViewController.arView.layer.position = pos;
    CGAffineTransform rotate = CGAffineTransformMakeRotation(rot * M_PI  / 180);
    arViewController.arView.transform = rotate;
}

@end
