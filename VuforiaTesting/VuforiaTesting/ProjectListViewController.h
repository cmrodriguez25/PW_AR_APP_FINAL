//
//  ProjectListViewController.h
//  VuforiaTesting
//
//  Created by cynthia besada on 8/6/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *listOfProjects;
}

@end
