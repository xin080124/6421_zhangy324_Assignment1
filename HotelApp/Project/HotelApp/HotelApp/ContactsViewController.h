//
//  ContactsViewController.h
//  HotelApp
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h> 

@interface ContactsViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    MFMailComposeViewController *mailComposeViewController;
    NSMutableArray *locationsAnnotations;

}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UILabel *labelMessage;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *lableAddress;
@property (strong, nonatomic) IBOutlet UILabel *labelPostOffice;
@property (strong, nonatomic) IBOutlet UILabel *labelWebPage;
@property (strong, nonatomic) IBOutlet UIButton *buttonCall;
@property (strong, nonatomic) IBOutlet UILabel *telephoneLabel;
@property (strong, nonatomic) IBOutlet UIButton *buttonEmail;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

- (IBAction)buttonCallClick:(id)sender;
- (IBAction)buttonEmailClick:(id)sender;

@end
