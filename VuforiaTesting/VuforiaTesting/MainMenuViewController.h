//
//  MainMenuViewcontrollerViewController.h
//  VuforiaTesting
//
//  Created by cynthia besada on 8/1/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialTabBarController.h"

@interface MainMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *menuItems;
    UITabBarController *TTabBarController;
    
}
@property (nonatomic, retain) IBOutlet UITabBarController *TTabBarController;


@end
