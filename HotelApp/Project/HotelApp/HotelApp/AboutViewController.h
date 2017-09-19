//
//  AboutViewController.h
//  HotelApp
//
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController {
    NSMutableDictionary *aboutInfo;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageViewAbout;
@property (strong, nonatomic) IBOutlet UILabel *titleAbout;
@property (strong, nonatomic) IBOutlet UITextView *textAbout;
@end
