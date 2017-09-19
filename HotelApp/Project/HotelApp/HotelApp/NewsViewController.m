//
//  NewsViewController.m
//  HotelApp
//
//

#import "NewsViewController.h"
#import "CellNews.h"
#import "NewsItemViewController.h"
#import "Feed.h"

#define kConfigPlistName @"config"

@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize tableViewNews;

//Returns NSDictionary array from plist with given name.
- (NSArray*)newsFromPlistNamed:(NSString*)plistName {
    NSMutableArray *newMenus = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"News"];
    [newMenus addObjectsFromArray:[dictionary objectForKey:@"newsItems"]];
    return newMenus;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    news = [[NSMutableArray alloc] init ];
    feedDownloader = [[FeedDownloader alloc] init];
    [feedDownloader setFeedDownloaderDelegate:self];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTableViewNews:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [tableViewNews setUserInteractionEnabled:NO];
    
    if (feedDownloader) {
        [feedDownloader stop];
        [feedDownloader start];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [tableViewNews setUserInteractionEnabled:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"CellNews";
    
    CellNews *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    Feed *newsItem = [news objectAtIndex:indexPath.row];
    NSString * date = [newsItem.feedDate substringWithRange:NSMakeRange(0, newsItem.feedDate.length-13)];
    [cell.labelDate setText:date];
    [cell.labelTitle setText:[newsItem feedTitle]];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate methods

//Called when user taps on one of the rows in tableView.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// Called before pushing new view controller, sets data for view controller
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"NewsItemSegue"]) {
        NewsItemViewController *newsItemVeiwController = [segue destinationViewController];
        
        int row = [[tableViewNews indexPathForSelectedRow] row];
        Feed *newsItem = [news objectAtIndex:row];
        [newsItemVeiwController setNewsItem:newsItem];
    }
}

//Called when feeds are downloaded from server, updates the table
-(void)feedsDownloaded:(NSArray*)newFeeds{
    if (news) {
        news = nil;
    }
    if (newFeeds) {
        news = [[NSMutableArray alloc] initWithArray:newFeeds];
        [tableViewNews reloadData];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No news" message:@"No news found, please check your network connection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    [tableViewNews setUserInteractionEnabled:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
