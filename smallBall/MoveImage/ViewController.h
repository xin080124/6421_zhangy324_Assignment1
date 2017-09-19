//
//  ViewController.h
//  MoveImage
//
//  Created by 商 文博 on 12-12-2.
//  Copyright (c) 2012年 商 文博. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlueViewController;
@class YeallowViewController;

@interface ViewController : UIViewController

@property (nonatomic,retain) BlueViewController *blueViewController;
@property (nonatomic,retain) YeallowViewController *yeallowViewController;

-(IBAction)switchView:(id)sender;

@end
