//
//  NewsItemViewController.h
//  HotelApp
//
//


#import <UIKit/UIKit.h>
#import "Feed.h"
#import "MBProgressHUD.h"

@interface NewsItemViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *descriptionWebView;
@property (strong, nonatomic) Feed *newsItem;

@end
