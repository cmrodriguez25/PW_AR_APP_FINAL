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
    
    

    
   /* self.navigationController.navigationBar.translucent = YES; // Setting this slides the view up, underneath the nav bar (otherwise it'll appear black)
    const float colorMask[6] = {233, 255, 233, 255, 233, 255};
    UIImage *img = [[UIImage alloc] init];
    UIImage *maskedImage = [UIImage imageWithCGImage: CGImageCreateWithMaskingColors(img.CGImage, colorMask)];
    
    [self.navigationController.navigationBar setBackgroundImage:maskedImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setShadowImage:[[UIImage alloc] init]];
    [img release];*/
    
    CGRect rect = self.navigationController.navigationBar.bounds;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
        [[UIColor colorWithRed:0./255 green:227./255 blue: 100./255 alpha:.5] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];

    UIGraphicsEndImageContext();
    
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
    
    tableView.contentInset = UIEdgeInsetsMake([self navigationController].navigationBar.frame.size.height, 0, 0,0);
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
