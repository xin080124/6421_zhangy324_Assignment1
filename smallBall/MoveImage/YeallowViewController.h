//
//  YeallowViewController.h
//  MoveImage
//
//  Created by 商 文博 on 12-12-2.
//  Copyright (c) 2012年 商 文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YeallowViewController : UIViewController

@property (nonatomic,retain) IBOutlet UISwitch *switchButton;
@property (nonatomic,retain) IBOutlet UISlider *slider;

-(IBAction)switchChanged:(id)sender;
-(IBAction)sliderValue:(id)sender;

@end
