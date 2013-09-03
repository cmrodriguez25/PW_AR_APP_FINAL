//
//  ProjectListViewController.m
//  VuforiaTesting
//
//  Created by cynthia besada on 8/6/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "ProjectListViewController.h"
#import "ProjectDetailTabBarViewController.h"

@interface ProjectListViewController ()

@end

@implementation ProjectListViewController

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
   // listOfProjects = [[NSMutableArray alloc]init];
    self.navigationItem.title = @"Projects";
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
	// Do any additional setup after loading the view.
     NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    // Path to the project specific Resources Folder
    resourcePath = [NSString stringWithFormat:@"%@/Projects", resourcePath];
    NSError *error;
    
    NSMutableArray *directoryContents = [[NSMutableArray alloc]init];
     directoryContents = (NSMutableArray *)[[NSFileManager defaultManager] contentsOfDirectoryAtPath:resourcePath error:&error];

    for (int x = 0; x < directoryContents.count; x++) {
        directoryContents[x] = [directoryContents[x] stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    
    }
    
    listOfProjects = [[NSMutableArray alloc]initWithArray:directoryContents];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [self viewDidLoad];
}


#pragma TABLE VIEW METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [listOfProjects count];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView.backgroundView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leaves.jpg"]];

    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = [listOfProjects objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor clearColor];
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(245/255.0) blue:(245/255.0) alpha:.3];
    cell.selectedBackgroundView = selectionColor;
    cell.opaque = NO;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"ProjectDetail" bundle:nil];
     ProjectDetailTabBarViewController*vc = [sb instantiateViewControllerWithIdentifier:@"ProjectDetailView"];
    
    [vc prepareProjectDetail:cellText];
    [self.navigationController pushViewController:vc animated:NO];
    
  

}

@end
