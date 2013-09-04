//
//  MapsViewController.h
//  VuforiaTesting
//
//  Created by Michell on 9/3/13.
//  Copyright (c) 2013 Michell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapsViewController : UIViewController<UIScrollViewDelegate> {
    UIScrollView *scrollView;
    NSMutableArray *imageArray;
}

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

-(void)initImageArray;
-(void)addObjectToImageArray: (UIImage *)img;
@end
