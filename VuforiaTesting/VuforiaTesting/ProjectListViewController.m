//
//  ProjectListViewController.m
//  VuforiaTesting
//
//  Created by cynthia besada on 8/6/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import "ProjectListViewController.h"
#import "ProjectDetailTabBarViewController.h"
#import "ProjectViewController.h"

@interface ProjectListViewController ()

@end

@implementation ProjectListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.translucent = YES; // Setting this slides the view up, underneath the nav bar (otherwise it'll appear black)
    CGRect rect = self.navigationController.navigationBar.bounds;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [[UIColor colorWithRed:255./255 green:255./255 blue: 255./255 alpha:.7] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    UIGraphicsEndImageContext();

    //[[UIBarButtonItem appearance] setBackBarButtonItem:backBarButtonItem];
}


- (void) popViewController {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // listOfProjects = [[NSMutableArray alloc]init];
    self.navigationItem.title = @"Projects";


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
    
    //[directoryContents exchangeObjectAtIndex:0 withObjectAtIndex:1];
    listOfProjects = [[NSMutableArray alloc]initWithArray:directoryContents];
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor blackColor]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Projects", @"");
    [label sizeToFit];
    
    
    UIImage *backButtonImage = [UIImage imageNamed:@"backButton.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton setImage:backButtonImage
                forState:UIControlStateNormal];
    
    backButton.frame = CGRectMake(0, 0, backButtonImage.size.width, backButtonImage.size.height);
    
    [backButton addTarget:self
                   action:@selector(popViewController)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;

    
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
    tableView.contentInset = UIEdgeInsetsMake([self navigationController].navigationBar.frame.size.height, 0, 0,0);   
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    return 1;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView.backgroundView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leaves.jpg"]];

    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    
  // cell.textLabel.font = [UIFont fontWithName:@"Arial" size:10];
    
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    cell.textLabel.text = [listOfProjects objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.contentView.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.2];
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(245/255.0) blue:(245/255.0) alpha:.7];
    cell.selectedBackgroundView = selectionColor;
    //cell.opaque = NO;
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    [cell setSelected:NO];

    if(indexPath.row == 0)
    {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"ProjectDetail" bundle:nil];
     ProjectDetailTabBarViewController*vc = [sb instantiateViewControllerWithIdentifier:@"ProjectDetailView"];
    
    [vc prepareProjectDetail:cellText];
    [self.navigationController pushViewController:vc animated:NO];
    
    }
    else
    {
        ProjectViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"projectView"];
        //[vc prepareProjectDetail:cellText];
        [self.navigationController pushViewController:vc animated:NO];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

@end
