//
//  BlueViewController.m
//  MoveImage
//
//  Created by 商 文博 on 12-12-2.
//  Copyright (c) 2012年 商 文博. All rights reserved.
//

#import "BlueViewController.h"
#import "MyMessage.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

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
    pos = CGPointMake(15.0, 7.5);
    
    
    MyMessage *data = [MyMessage instance];
    NSLog(@"data:%c",data.iScore);
    UIImage *fireImage = [UIImage imageNamed:@"fireball.png"];
    
    if (data.iScore) {
        fireImage = [UIImage imageNamed:@"fireball.png"];
    }else{
        fireImage = [UIImage imageNamed:@"smokeball.png"];
    }

    
    fireBall = [[UIImageView alloc]initWithImage:fireImage];
    [fireBall setFrame:CGRectMake(0, 0, 32, 32)];
    [self.view addSubview:fireBall];
    
    [NSTimer scheduledTimerWithTimeInterval:(data.a/5000)
									 target:self
								   selector:@selector(onTimer)
								   userInfo:nil repeats:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void) onTimer {
    CGRect temp = fireBall.frame;
    NSInteger nX = temp.origin.x;
    NSInteger nY = temp.origin.y;
    
	float x = nX + pos.x;
	float y = nY + pos.y;
	
	if (x+32 > 320 || x < 0)
		pos.x = -pos.x;
	if (y+32 > 460 || y < 0)
		pos.y = -pos.y;
    
    [fireBall setFrame:CGRectMake(x , y , 32, 32)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
