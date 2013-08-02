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

@interface PWParentViewController : ARParentViewController <ARTargetFoundDelegate> {
    HUDViewController* HUDVC;
    UIWindow* window;
}

@end
