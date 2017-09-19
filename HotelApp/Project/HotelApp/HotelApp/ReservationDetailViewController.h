//
//  ReservationDetailViewController.h
//  HotelApp
//
//


#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> 

typedef enum {
    up,
    down
}Direction;

#define KEYBOARD_ANIMATION_DURATION 0.4
#define PORTRAIT_KEYBOARD_HEIGHT 216

@interface ReservationDetailViewController : UIViewController <MFMailComposeViewControllerDelegate>{
    MFMailComposeViewController *mailComposeViewController;
    UIToolbar *keyboardToolbar;
    BOOL keyboardIsPresented;

}

@property (strong, nonatomic) IBOutlet UILabel *labelDateArrival;
@property (strong, nonatomic) IBOutlet UILabel *labelDateDeparture;
@property (strong, nonatomic) IBOutlet UILabel *labelNumberOfPeople;
@property (strong, nonatomic) IBOutlet UILabel *labelRoomCategory;
@property (strong, nonatomic) IBOutlet UITableView *tableViewPrice;
@property (strong, nonatomic) IBOutlet UITableView *tableViewAdditionalInfo;

@property (strong, nonatomic) NSDictionary *reservationInfo;

- (IBAction)reserveButtonClick:(id)sender;
- (NSDictionary*)contactsInfoFromPlistNamed:(NSString*)plistName;

@end
