//
//  main.m
//  VuforiaTesting
//
//  Created by Michell on 7/30/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    //int retVal = UIApplicationMain(argc, argv, nil, @"AppDelegate");
    //[pool release];
    //return retVal;
    
    int retVal = -1;
    @try {
        retVal = UIApplicationMain(argc, argv, nil, @"AppDelegate");
    }
    @catch (NSException* exception) {
        NSLog(@"Uncaught exception: %@", exception.description);
        NSLog(@"Stack trace: %@", [exception callStackSymbols]);
    }
    
    [pool release];
    return retVal;
}
