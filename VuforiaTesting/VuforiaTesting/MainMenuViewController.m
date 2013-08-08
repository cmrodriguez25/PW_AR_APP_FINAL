//
//  MainMenuViewcontrollerViewController.m
//  VuforiaTesting
//
//  Created by cynthia besada on 8/1/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ProjectListViewController.h"
#import "TutorialViewController.h"
#import "AboutUsViewController.h"
@interface MainMenuViewController ()

@end

@implementation MainMenuViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    menuItems = [[NSMutableArray alloc]initWithObjects:@"Projects",@"Tutorial",@"About Us", @"???", nil];
	
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma TABLE VIEW METHODS
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";

    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

    cell.textLabel.text = [menuItems objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath    {
    
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    
    
    if([cellText isEqualToString: @"Projects"])
    {
        ProjectListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ProjectListView"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if ([cellText isEqualToString:@"Tutorial"])
    {
        TutorialViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorialView"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if ([cellText isEqualToString:@"About Us"])
    {
        AboutUsViewController*controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsView"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if ([cellText isEqualToString:@"???"])
    {
        
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuItems count];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (void)dealloc {
    
    [super dealloc];
}
@end
