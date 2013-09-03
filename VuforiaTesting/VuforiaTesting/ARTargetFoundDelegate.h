//
//  ARTargetFoundDelegate.h
//  VuforiaTesting
//
//  Created by Michell on 8/1/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ARTargetFoundDelegate <NSObject>
    - (void)targetFound:(NSString *)target;
    - (void)targetLost;
@end
