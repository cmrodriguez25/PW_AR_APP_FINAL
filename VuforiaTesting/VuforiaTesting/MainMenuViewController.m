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
#import "TFirstViewController.h"
#import "TutorialTabBarController.h"
@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
@synthesize TTabBarController;


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
    //self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    //self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.translucent = YES; // Setting this slides the view up, underneath the nav bar (otherwise it'll appear black)
    CGRect rect = self.navigationController.navigationBar.bounds;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [[UIColor colorWithRed:0./255 green:227./255 blue: 100./255 alpha:.5] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    UIGraphicsEndImageContext();
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
        tableView.backgroundView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leaves.jpg"]];
    
        cell.textLabel.text = [menuItems objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor clearColor];
        UIView *selectionColor = [[UIView alloc] init];
        selectionColor.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(245/255.0) blue:(245/255.0) alpha:.3];
        cell.selectedBackgroundView = selectionColor;
        cell.opaque = NO;
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:16];

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath    {

    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
    NSString *cellText = cell.textLabel.text;
    
    
    if([cellText isEqualToString: @"Projects"])
    {
        ProjectListViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ProjectListView"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if ([cellText isEqualToString:@"Tutorial"])
    {
       
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Tutorial" bundle:nil];
        TutorialTabBarController*vc = [sb instantiateViewControllerWithIdentifier:@"TutorialTabBarView"];
        
        //[vc prepareProjectDetail:cellText];
        [self.navigationController pushViewController:vc animated:NO];
        
       // TFirstViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TFirstView"];
        //[self.navigationController pushViewController:vc animated:YES];
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
