//
//  AboutViewController.m
//  HotelApp
//
//

#import "AboutViewController.h"

#define kConfigPlistName @"config"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize imageViewAbout;
@synthesize titleAbout;
@synthesize textAbout;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Returns NSDictionary with iformations about hotel from plist with given name.
- (NSDictionary*)aboutInfoFromPlistNamed:(NSString*)plistName {
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"About"];
    return dictionary;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    aboutInfo = [[NSMutableDictionary alloc] init ];
    [aboutInfo setDictionary:[self aboutInfoFromPlistNamed:kConfigPlistName]];
    [self.textAbout setText:[aboutInfo objectForKey:@"text"]];
    [self.titleAbout setText:[aboutInfo objectForKey:@"title"]];
    [self.imageViewAbout setImage:[UIImage imageNamed:[aboutInfo objectForKey:@"image"]]];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setImageViewAbout:nil];
    [self setTitleAbout:nil];
    [self setTextAbout:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
