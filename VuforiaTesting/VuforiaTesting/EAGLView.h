//
//  EAGLView.h
//  VuforiaTesting
//
//  Created by Michell on 7/30/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "AR_EAGLView.h"
#import "ARTargetFoundDelegate.h"
@interface EAGLView : AR_EAGLView

    @property (nonatomic, retain) id <ARTargetFoundDelegate> targetFoundDelegate;

@end
