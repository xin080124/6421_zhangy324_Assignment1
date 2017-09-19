//
//  NewsViewController.h
//  HotelApp
//
//

#import <UIKit/UIKit.h>
#import "FeedDownloaderDelegate.h"
#import "FeedDownloader.h"
#import "MBProgressHUD.h"

@interface NewsViewController : UIViewController <FeedDownloaderDelegate>{
    NSMutableArray *news;
    FeedDownloader *feedDownloader;
}
@property (strong, nonatomic) IBOutlet UITableView *tableViewNews;

@end
