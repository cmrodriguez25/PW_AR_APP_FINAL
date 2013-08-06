//
//  ProjectDetailTabBarViewController.h
//  VuforiaTesting
//
//  Created by Michell on 8/3/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UITabBar.h>

@interface ProjectDetailTabBarViewController : UITabBarController {
    @private
    NSString *_projectName;
}

-(void)prepareProjectDetail: (NSString *)projectName;

@end