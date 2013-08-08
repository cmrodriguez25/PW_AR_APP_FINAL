//
//  PWARViewController.m
//  VuforiaTesting
//
//  Created by Michell on 8/1/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "PWARViewController.h"
#import "EAGLView.h"

@interface PWARViewController ()

@end

@implementation PWARViewController

- (id) initWithModelDict:(NSMutableDictionary *)modelDict
{
    self = [super init];
    if (self) {
        _modelDict = modelDict;
    }
    
    return self;
}

- (void) loadView {
    [super loadView];
    [arView setModelDict:_modelDict];
}

- (void) targetFound:(NSString *)target
{
    [self.targetFoundDelegate targetFound:target];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arView.targetFoundDelegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
