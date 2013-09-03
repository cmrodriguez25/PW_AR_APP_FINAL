/*==============================================================================
 Copyright (c) 2010-2013 QUALCOMM Austria Research Center GmbH .
 All Rights Reserved.
 Qualcomm Confidential and Proprietary
 ==============================================================================*/


#import <UIKit/UIKit.h>
#import "EAGLView.h"
#import "OverlayViewController.h"


@interface HUDViewController : UIViewController {
    IBOutlet UITextView *detailsView;
    IBOutlet UIImageView *overlayView;
    IBOutlet UIButton *infoButton;
}

@property (nonatomic, retain) IBOutlet UITextView *details;
@property (nonatomic, retain) IBOutlet UIImageView *overlayView;
@property (nonatomic, retain) IBOutlet UIButton *infoButton;

-(void) showOverlay:(NSString *)path;
-(void) displayText:(NSString *)message;
-(void) hideOverlay;
-(IBAction)clickInfoButton:(id)sender;
@end
