//
//  PWARViewController.h
//  VuforiaTesting
//
//  Created by Michell on 8/1/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "ARViewController.h"
#import "ARTargetFoundDelegate.h"
#import "EAGLView.h"

@interface PWARViewController : ARViewController <ARTargetFoundDelegate> {
    NSMutableDictionary* _modelDict;
    
}

@property (nonatomic, retain) id <ARTargetFoundDelegate> targetFoundDelegate;

-(id)initWithModelDict:(NSDictionary*)modelDict;

@end