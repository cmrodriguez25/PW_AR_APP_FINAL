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
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
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
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    cell.textLabel.text = [listOfProjects objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
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
