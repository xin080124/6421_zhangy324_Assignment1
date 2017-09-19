//
//  ReservationViewController.h
//  HotelApp
//
//

#import <UIKit/UIKit.h>

@interface ReservationViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>{
    UIToolbar *keyboardToolbar;
    UIDatePicker *datePicker;
    UIPickerView *pickerView;
    BOOL keyboardIsPresented;
    NSDateFormatter *dateFormatter;
    NSMutableArray *arrayRoomCategory;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableViewReservation;

- (IBAction)buttonGetPriceClick:(id)sender;

@end
