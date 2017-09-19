//
//  YeallowViewController.m
//  MoveImage
//
//  Created by 商 文博 on 12-12-2.
//  Copyright (c) 2012年 商 文博. All rights reserved.
//

#import "YeallowViewController.h"
#import "MyMessage.h"

@interface YeallowViewController ()

@end

@implementation YeallowViewController
@synthesize switchButton;
@synthesize slider;

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
    MyMessage *my = [MyMessage instance];
    [switchButton setOn:my.iScore];
    NSLog(@"@@@@%lf",my.a);
    [slider setValue:my.a];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)switchChanged:(id)sender
{
    UISwitch *temp = (UISwitch*)sender;
    MyMessage *my = [MyMessage instance];
    my.iScore = temp.isOn;
}
-(IBAction)sliderValue:(id)sender
{
    UISlider *sliderTemp = (UISlider*)sender;
    MyMessage *my = [MyMessage instance];
    my.a = sliderTemp.value;
    NSLog(@"%lf",my.a);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
