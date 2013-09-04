//
//  ARUIViewController.m
//  VuforiaTesting
//
//  Created by Michell on 7/31/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "HUDViewController.h"
#import "OverlayViewController.h"

bool isInterfaceOrientationPortrait=false;
@implementation HUDViewController
@synthesize overlayView;
@synthesize infoButton;

NSString *details;

- (void) showOverlay:(NSString *)overlayFilePath {
    UIImage *img = [UIImage imageWithContentsOfFile:overlayFilePath];
    overlayView.image = img;
}

-(void) hideOverlay {
    overlayView.image = nil;
}

-(IBAction)clickInfoButton:(id)sender {
    detailsView.hidden = !detailsView.hidden;
}

- (void) displayText:(NSString *)message
{
    @try {
        if([message isEqual: @"Diesel"]) {
            infoButton.hidden = NO;
            //[details setText:@"This is a yellow teapot."];
            detailsView.text = @"THE SOUTH FACADE OF AHC-4 WAS DESIGNED TO PROTECT THE OFFICES FROM SOLAR HEAT GAIN. \n\nEACH WINDOW IS TILTED IN RESPONSE TO A HEAT STUDY DIAGRAM THAT WAS GENERATED FOR THE SOUTH FACADE OF THE BUILDING.";
        } else {
            infoButton.hidden = YES;
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }

}

- (void) viewDidLoad
{
    //details.contentInset = UIEdgeInsetsMake(10.0, 0, 0, 0);
}

- (void) setMenuCallBack:(SEL)callback forTarget:(id)target
{
    //menuId = target;
    //menuSel = callback;
}


- (void)dealloc {
    [super dealloc];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

@end
