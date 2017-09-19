//
//  ReservationViewController.m
//  HotelApp
//
//

#import "ReservationViewController.h"
#import "CellReservation.h"
#import "ReservationDetailViewController.h"

#define kConfigPlistName @"config"
#define kAlertTitle @"Missing input"
#define kAlertMessage @"Please fill in all fields"

@interface ReservationViewController ()

@end

@implementation ReservationViewController

 
@synthesize tableViewReservation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Returns NSDictionary array from plist with given name.
- (NSArray*)roomCategoriesFromPlistNamed:(NSString*)plistName {
    NSMutableArray *newMenus = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"Reservation"];
    [newMenus addObjectsFromArray:[dictionary objectForKey:@"roomCategories"]];
    return newMenus;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayRoomCategory = [[NSMutableArray alloc] init ];
    [arrayRoomCategory setArray:[self roomCategoriesFromPlistNamed:kConfigPlistName]];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMMM yyyy"];
    pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    

    pickerView.delegate = self;
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateLabelFromPicker:) forControlEvents:UIControlEventValueChanged];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    if (keyboardToolbar == nil) {
        
        keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 44.0f)];
        keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
        
        UIBarButtonItem *previousButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self 
        action:@selector(previousField:)] ;
        
        UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                    style:UIBarButtonItemStyleBordered target:self
                        action:@selector(nextField:)];
        
        UIBarButtonItem *spaceBetweenButtons = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                target:nil action:nil] ;
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard:)];
        
        [keyboardToolbar setItems:[[NSArray alloc] initWithObjects:previousButton, nextButton, spaceBetweenButtons, doneButton, nil] ];
        
    }
    
    keyboardIsPresented = NO;
    
}

- (void)viewDidUnload
{
    [self setTableViewReservation:nil];
    [datePicker removeTarget:self action:@selector(updateLabelFromPicker:) forControlEvents:UIControlEventValueChanged];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"CellReservation";
    CellReservation *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (indexPath.row == 0) {
        cell.textFieldCell.inputView = datePicker;
        cell.textFieldCell.inputAccessoryView = keyboardToolbar;
        [cell.textFieldCell setPlaceholder:@"Arrival date"];
        
    }
    
    else if (indexPath.row == 1) {
        cell.textFieldCell.inputView = datePicker;
        cell.textFieldCell.inputAccessoryView = keyboardToolbar;
        [cell.textFieldCell setPlaceholder:@"Departure date"];
    }
    
    else if (indexPath.row == 2){
        cell.textFieldCell.inputView = pickerView;
        cell.textFieldCell.inputAccessoryView = keyboardToolbar;
        [cell.textFieldCell setPlaceholder:@"People"];
    }
    else {
        cell.textFieldCell.inputView = pickerView;
        cell.textFieldCell.inputAccessoryView = keyboardToolbar;
        [cell.textFieldCell setPlaceholder:@"Room category"];
    }
    
    
    return cell;
    
}

#pragma mark - UITableViewDelegate methods


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
}

#pragma mark - UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    int numOfRows = [tableViewReservation numberOfRowsInSection:0];
    int index = 0;
    for (int i = 0; i < numOfRows; i++) {
        UITextField *textField = (UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            index = i;
            break;
            
        }
    } 
    
    if (index == 2) {
        return [NSString stringWithFormat:@"%d",row + 1];
    }
    
    else {
        
        return [[arrayRoomCategory objectAtIndex:row] objectForKey:@"categoryName"];
    }
    
}


- (void)pickerView:(UIPickerView *)_pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *title = [self pickerView:_pickerView titleForRow:row forComponent:component];
    
    int numOfRows = [tableViewReservation numberOfRowsInSection:0];
    
    for (int i = 0; i < numOfRows; i++) {
        UITextField *textField = (UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            [textField setText:title];
            break;
            
        }
    } 
}

#pragma mark - UIPickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    int numOfRows = [tableViewReservation numberOfRowsInSection:0];
    int index = 0;
    for (int i = 0; i < numOfRows; i++) {
        UITextField *textField = (UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            index = i;
            break;
            
        }
    } 
    
    if (index == 2) {
        return 100;
    }
    
    else {
        return [arrayRoomCategory count];
    }
}



#pragma mark - Keyboard methods

- (void)keyboardWillHide:(NSNotification *)notification {
    
    CGPoint point = CGPointMake(self.tableViewReservation.contentOffset.x, 0);
  
    
    self.tableViewReservation.bounces = NO;
    
    [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION animations:^{
        self.tableViewReservation.contentOffset = point;
    } ];
    
    keyboardIsPresented = NO;
}



- (void)keyboardWillShow:(NSNotification *)notification {
    
    if (datePicker.superview) {
       [datePicker setDate:[NSDate date]]; 
    }
    
    int numOfRows = [tableViewReservation numberOfRowsInSection:0];
    int iOffset = 0;
    for (int i = 0; i < numOfRows; i++) {
        UITextField *textField = (UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            iOffset = i;
            if (![textField.text isEqualToString:@""] && i < 2) {
                [datePicker setDate:[dateFormatter dateFromString:textField.text]]; 
                
            }
            
            if ([textField.text isEqualToString:@""] && i < 2) {
                [textField setText:[dateFormatter stringFromDate:datePicker.date]];
            }
            
            if (![textField.text isEqualToString:@""] && i > 2) {
                for (NSDictionary *dic in arrayRoomCategory) {
                    NSString *categoryName = [dic objectForKey:@"categoryName"];
                    if ([categoryName isEqualToString:textField.text]) {
                        NSString *categoryPrice = [dic objectForKey:@"categoryPrice"];
                        NSDictionary *room = [NSDictionary dictionaryWithObjectsAndKeys:categoryName,@"categoryName",categoryPrice,@"categoryPrice", nil];
                        int row = [arrayRoomCategory indexOfObject:room];
                        [pickerView.delegate pickerView:pickerView didSelectRow:row inComponent:0];
                        break;
                    }
                }
                
            }
            
            if (![textField.text isEqualToString:@""] && i == 2) {
                int row = [textField.text intValue];
                [pickerView.delegate pickerView:pickerView didSelectRow:row-1 inComponent:0];
            }
            
            if ([textField.text isEqualToString:@""] && i >= 2) {
                //int row = [pickerView selectedRowInComponent:0];
                NSString *text = [pickerView.delegate pickerView:pickerView titleForRow:0 forComponent:0];
                [textField setText:text];
            }
            break;
            
        }
        
    } 
    
    //if (!keyboardIsPresented) {
        CGPoint point = CGPointMake(self.tableViewReservation.contentOffset.x, iOffset*self.tableViewReservation.rowHeight);
        
        self.tableViewReservation.bounces = NO;
        
        [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION animations:^{
            self.tableViewReservation.contentOffset = point;
        } ];
        
        keyboardIsPresented = YES;
    //}
    
}

- (void)animateTableViewMove:(Direction)direction {
    
    CGPoint point;
    if (direction == up) {
        point = CGPointMake(self.tableViewReservation.contentOffset.x, self.tableViewReservation.contentOffset.y + self.tableViewReservation.rowHeight);
    }
    
    else {
        
        point = CGPointMake(self.tableViewReservation.contentOffset.x, self.tableViewReservation.contentOffset.y - self.tableViewReservation.rowHeight);
    }
    
    self.tableViewReservation.bounces = NO;
    
    [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION animations:^{
        self.tableViewReservation.contentOffset = point;
    } ];
}

#pragma mark - Keyboard toolbar

- (void)resignKeyboard:(id)sender {
    
    [self keyboardWillHide:nil];
    
    int numOfRows = [self.tableViewReservation numberOfRowsInSection:0];
    for (int i = 0; i < numOfRows; i++) {
        
        if ([(UITextField *)[(CellReservation*)[self.tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell] isFirstResponder]) {
            [(UITextField *)[(CellReservation*)[self.tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell] resignFirstResponder];
        }
    }
}

- (void)previousField:(id)sender {
    int activeRow = 0;
    
    for (int i = 0; i < 4; i++) {
        
        if ([(UITextField *)[(CellReservation*)[self.tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell] isFirstResponder]) {
            activeRow = i;
            break;
            
        }
    }
    if (activeRow == 0) activeRow = 3;
    else --activeRow;
    [(UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(activeRow) inSection:0]] textFieldCell] becomeFirstResponder];
}

- (void)nextField:(id)sender {
    int activeRow = 0;
    
    for (int i = 0; i < 4; i++) {
        UITextField *textField = (UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            activeRow = i;
            break;
        }
    }
    if (activeRow < 3) ++activeRow;
    else activeRow = 0;
    [(UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(activeRow) inSection:0]] textFieldCell] becomeFirstResponder];
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self keyboardWillHide:nil];
    [textField resignFirstResponder];
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [pickerView reloadAllComponents];
    [self keyboardWillShow:nil];
    
}

#pragma mark - Other methods

- (void)updateLabelFromPicker:(id)sender {
    
    int numOfRows = [tableViewReservation numberOfRowsInSection:0];
    
    for (int i = 0; i < numOfRows; i++) {
        UITextField *textField = (UITextField *)[(CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            [textField setText:[dateFormatter stringFromDate:datePicker.date]];
            break;
            
        }
    }
}

- (IBAction)buttonGetPriceClick:(id)sender {
    
    if ([((CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]).textFieldCell.text isEqualToString:@""] ||
        [((CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]).textFieldCell.text isEqualToString:@""] ||
        [((CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]]).textFieldCell.text isEqualToString:@""] ||
        [((CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]]).textFieldCell.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kAlertTitle message:kAlertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    else {
        [self performSegueWithIdentifier:@"ReservationDetailSegue" sender:nil];
    }
    
}

// Called before pushing new view controller, sets data for view controller
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ReservationDetailSegue"]) {
        ReservationDetailViewController *reservationDetailVeiwController = [segue destinationViewController];
        
        
        CellReservation *cell = (CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSString *arrivalDate = cell.textFieldCell.text;
        cell = (CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        NSString *departureDate = cell.textFieldCell.text;
        cell = (CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
        NSString *numberOfPeople = cell.textFieldCell.text;
        cell = (CellReservation*)[tableViewReservation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
        NSString *roomCategory = cell.textFieldCell.text;
        float totalPrice = 0;
        for (NSDictionary *dic in arrayRoomCategory) {
            NSString *categoryName = [dic objectForKey:@"categoryName"];
            if ([categoryName isEqualToString:roomCategory]) {
                NSString *categoryPrice = [dic objectForKey:@"categoryPrice"];
                NSDate *arrDate = [dateFormatter dateFromString:arrivalDate];
                NSDate *depDate = [dateFormatter dateFromString:departureDate];
                totalPrice  = [categoryPrice floatValue] * [numberOfPeople floatValue] * ([depDate timeIntervalSinceDate:arrDate]/86400);
            }
        }
        NSString *totalPriceString = [NSString stringWithFormat:@"$%.2f",totalPrice];
        
        NSDictionary *reservationInfo = [NSDictionary dictionaryWithObjectsAndKeys:totalPriceString, @"totalPrice",arrivalDate, @"arrivalDate",departureDate, @"departureDate",numberOfPeople, @"numberOfPeople",roomCategory, @"roomCategory",  nil];
        [reservationDetailVeiwController setReservationInfo:reservationInfo];
    }
}

@end
