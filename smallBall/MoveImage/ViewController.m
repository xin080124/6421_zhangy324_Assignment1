//
//  ViewController.m
//  MoveImage
//
//  Created by 商 文博 on 12-12-2.
//  Copyright (c) 2012年 商 文博. All rights reserved.
//

#import "ViewController.h"
#import "BlueViewController.h"
#import "YeallowViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize blueViewController;
@synthesize yeallowViewController;

- (void)viewDidLoad
{
    BlueViewController *blueTemp=[[BlueViewController alloc] initWithNibName:@"BlueViewController"bundle:nil];
	self.blueViewController = blueTemp;
	[self.view insertSubview:self.blueViewController.view atIndex:0];//0表示再最顶层显示；
	
	[blueTemp release];
    [super viewDidLoad];
}
-(IBAction)switchView:(id)sender
{
	if(self.blueViewController.view.superview == nil)
	{
            self.blueViewController=[[BlueViewController alloc] initWithNibName:@"BlueViewController"bundle:nil];
		[self.yeallowViewController.view removeFromSuperview];
		[self.view insertSubview:self.blueViewController.view atIndex:0];//0表示再最顶层显示；
	}
	else
        if(self.yeallowViewController.view.superview == nil)
        {
                self.yeallowViewController=[[YeallowViewController alloc] initWithNibName:@"YeallowViewController"bundle:nil];
            [self.blueViewController.view removeFromSuperview];
            [self.view insertSubview:self.yeallowViewController.view atIndex:0];
        }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
