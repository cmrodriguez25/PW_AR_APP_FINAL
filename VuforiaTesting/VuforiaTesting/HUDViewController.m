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
@synthesize details;
@synthesize overlayView;


- (void) showOverlay:(NSString *)overlayFilePath {
    UIImage *img = [UIImage imageWithContentsOfFile:overlayFilePath];
    overlayView.image = img;
}

-(void) hideOverlay {
    overlayView.image = nil;
}

- (void) displayText:(NSString *)message
{
    @try {
        if([message isEqual: @"stones"]) {
            //[details setText:@"This is a yellow teapot."];
            details.text = @"This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. This is a yellow teapot. ";
        } else {
            //[details setText:@"This is a grey teapot."];
            details.text = @"This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. This is a grey teapot. ";
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
