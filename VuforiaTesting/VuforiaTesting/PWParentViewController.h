//
//  SecondViewController.h
//  VuforiaTesting
//
//  Created by Michell on 7/30/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "ARParentViewController.h"
#import "HUDViewController.h"
#import "PWARViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface PWParentViewController : ARParentViewController <ARTargetFoundDelegate> {
    HUDViewController* HUDVC;
    UIWindow* window;
    NSMutableDictionary* _modelDict;
    NSMutableDictionary *_overlayDict;
    MPMoviePlayerController *controller;
}

@property (nonatomic, strong) MPMoviePlayerController *controller;

-(id)initWithModelDict:(NSMutableDictionary *)modelDict andOverlays:(NSMutableDictionary *)overlayDict;
@end
