//
//  ReservationDetailViewController.m
//  HotelApp
//
//

#import "ReservationDetailViewController.h"
#import "CellAdditionalInfo.h"
#import "CellTotalPrice.h"
#import "JSON.h"

#define kReserveAction @"mail" // mail or api
#define kConfigPlistName @"config"

@interface ReservationDetailViewController ()

@end

@implementation ReservationDetailViewController
@synthesize labelDateArrival;
@synthesize labelDateDeparture;
@synthesize labelNumberOfPeople;
@synthesize labelRoomCategory;
@synthesize tableViewPrice;
@synthesize tableViewAdditionalInfo;

@synthesize reservationInfo;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    mailComposeViewController = [[MFMailComposeViewController alloc] init];
    [mailComposeViewController setMailComposeDelegate:self];
    [[mailComposeViewController navigationBar] setBarStyle:UIBarStyleBlackOpaque];

    
    [labelDateArrival setText:[reservationInfo objectForKey:@"arrivalDate"]];
    [labelDateDeparture setText:[reservationInfo objectForKey:@"departureDate"]];
    [labelNumberOfPeople setText:[reservationInfo objectForKey:@"numberOfPeople"]];
    [labelRoomCategory setText:[reservationInfo objectForKey:@"roomCategory"]];
    
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
    [self setLabelDateArrival:nil];
    [self setLabelDateDeparture:nil];
    [self setLabelNumberOfPeople:nil];
    [self setLabelRoomCategory:nil];
    [self setTableViewPrice:nil];
    [self setTableViewAdditionalInfo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == tableViewPrice) {
        return 1;
    }
    
    else if (tableView == tableViewAdditionalInfo){
        
        return 4;
    }
    
    else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellTotalPriceId = @"CellTotalPrice";
    static NSString *cellAdditionalInfo = @"CellAdditionalInfo";
    
    if (tableView == tableViewPrice) {
        CellTotalPrice *cell = [tableView dequeueReusableCellWithIdentifier:cellTotalPriceId];
        [cell.labelTotalPrice setText:[reservationInfo objectForKey:@"totalPrice"]];
        return cell;
    }
    
    else if (tableView == tableViewAdditionalInfo){
        
        CellAdditionalInfo *cell = [tableView dequeueReusableCellWithIdentifier:cellAdditionalInfo];
        
        if (indexPath.row == 0) {
            [cell.textFieldCell setPlaceholder:@"First name"];
        }
        if (indexPath.row == 1) {
            [cell.textFieldCell setPlaceholder:@"Last name"];
        }
        if (indexPath.row == 2) {
            [cell.textFieldCell setPlaceholder:@"Telephone Number"];
            cell.textFieldCell.keyboardType = UIKeyboardTypeNumberPad;
        }
        if (indexPath.row == 3) {
            [cell.textFieldCell setPlaceholder:@"Email addres"];
            cell.textFieldCell.keyboardType = UIKeyboardTypeEmailAddress;
        }
         cell.textFieldCell.inputAccessoryView = keyboardToolbar;
        return cell;
    }
    
    else {
        
        return nil;
    }
    
}

#pragma mark - Keyboard methods

- (void)keyboardWillHide:(NSNotification *)notification {
    
    CGPoint point = CGPointMake(self.tableViewAdditionalInfo.contentOffset.x, 0);
    
    
    self.tableViewAdditionalInfo.bounces = NO;
    
    [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION animations:^{
        self.tableViewAdditionalInfo.contentOffset = point;
    } ];
    
    keyboardIsPresented = NO;
}



- (void)keyboardWillShow:(NSNotification *)notification {
    
    int numOfRows = [tableViewAdditionalInfo numberOfRowsInSection:0];
    int iOffset = 0;
    for (int i = 0; i < numOfRows; i++) {
        UITextField *textField = (UITextField *)[(CellAdditionalInfo*)[tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            iOffset = i;
            break;
        }
    } 
    
    //if (!keyboardIsPresented) {
        CGPoint point = CGPointMake(self.tableViewAdditionalInfo.contentOffset.x, iOffset*self.tableViewAdditionalInfo.rowHeight);
        
        self.tableViewAdditionalInfo.bounces = NO;
        
        [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION animations:^{
            self.tableViewAdditionalInfo.contentOffset = point;
        } ];
        
        keyboardIsPresented = YES;
    //}
    
}

- (void)animateTableViewMove:(Direction)direction {
    
    CGPoint point;
    if (direction == up) {
        point = CGPointMake(self.tableViewAdditionalInfo.contentOffset.x, self.tableViewAdditionalInfo.contentOffset.y + self.tableViewAdditionalInfo.rowHeight);
    }
    
    else {
        point = CGPointMake(self.tableViewAdditionalInfo .contentOffset.x, self.tableViewAdditionalInfo.contentOffset.y - self.tableViewAdditionalInfo.rowHeight);
    }
    
    self.tableViewAdditionalInfo .bounces = NO;
    
    [UIView animateWithDuration:KEYBOARD_ANIMATION_DURATION animations:^{
        self.tableViewAdditionalInfo.contentOffset = point;
    } ];
}

#pragma mark - Keyboard toolbar

- (void)resignKeyboard:(id)sender {
    
    [self keyboardWillHide:nil];
    
    int numOfRows = [self.tableViewAdditionalInfo numberOfRowsInSection:0];
    for (int i = 0; i < numOfRows; i++) {
        
        if ([(UITextField *)[(CellAdditionalInfo*)[self.tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell] isFirstResponder]) {
            [(UITextField *)[(CellAdditionalInfo*)[self.tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell] resignFirstResponder];
        }
    }
}

- (void)previousField:(id)sender {
    int activeRow = 0;
    
    for (int i = 0; i < 4; i++) {
        
        if ([(UITextField *)[(CellAdditionalInfo*)[tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell] isFirstResponder]) {
            activeRow = i;
            break;
        }
    }
    if (activeRow == 0) activeRow = 3;
    else --activeRow;
    [(UITextField *)[(CellAdditionalInfo*)[tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(activeRow) inSection:0]] textFieldCell] becomeFirstResponder];
}

- (void)nextField:(id)sender {
    int activeRow = 0;
    
    for (int i = 0; i < 4; i++) {
        UITextField *textField = (UITextField *)[(CellAdditionalInfo *)[tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] textFieldCell];
        if ([textField isFirstResponder]) {
            activeRow = i;
            break;
        }
    }
    if (activeRow < 3) ++activeRow;
    else activeRow = 0;
    [(UITextField *)[(CellAdditionalInfo *)[tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(activeRow) inSection:0]] textFieldCell] becomeFirstResponder];
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self keyboardWillHide:nil];
    [textField resignFirstResponder];
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [self keyboardWillShow:nil];
    
}

- (IBAction)reserveButtonClick:(id)sender {
    
    NSString *arrivalDate = labelDateArrival.text;
    NSString *departureDate = labelDateDeparture.text;
    NSString *people = labelNumberOfPeople.text;
    NSString *roomCategory = labelRoomCategory.text;
    NSString *firstName = ((CellAdditionalInfo*)[tableViewAdditionalInfo cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]).textFieldCell.text; 
    NSString *lastName = ((CellAdditionalInfo*)[tableViewAdditionalInfo  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]).textFieldCell.text; 
    NSString *telephoneNumber = ((CellAdditionalInfo*)[tableViewAdditionalInfo  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]]).textFieldCell.text; 
    NSString *email = ((CellAdditionalInfo*)[tableViewAdditionalInfo  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]]).textFieldCell.text; 
    
    if (kReserveAction == @"mail") {
        
        if (![MFMailComposeViewController canSendMail]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Can't send" message:@"This device is unable to send emails." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return;
        }
        
        NSDictionary *contactsInfo = [self contactsInfoFromPlistNamed:kConfigPlistName];
        [mailComposeViewController setToRecipients:[NSArray arrayWithObject:[contactsInfo objectForKey:@"email"]]];
        NSString *text =  [NSString stringWithFormat:@"Arrival date: %@\nDeparture date: %@\nNumber of people: %@\nRoom category: %@\n\nFirst name: %@\nLast name: %@\nTelephone number: %@\nEmail: %@\n",arrivalDate,departureDate,people, roomCategory, firstName, lastName, telephoneNumber, email];
        [mailComposeViewController setSubject:@"Room reservation"];
        [mailComposeViewController setMessageBody:text isHTML:NO];
        [mailComposeViewController.navigationBar setTintColor:[UIColor colorWithRed:200/255 green:51/255 blue:51/255 alpha:1]];
        [self presentModalViewController:mailComposeViewController animated:YES];
        
    }
    
    else if (kReserveAction == @"api") {
        
        SBJsonWriter *writer = [[SBJsonWriter alloc] init];
        
        NSDictionary *jsonDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:arrivalDate, @"arrivalDate", departureDate,@"departureDate", people,@"people", roomCategory,@"roomCategory", firstName,@"firstName", lastName, @"lastName",telephoneNumber,@"telephone", email, @"email", nil];
        NSString *jsonString = [writer stringWithObject:jsonDictionary];
        NSLog(@"%@", jsonString);

    }
}

#pragma mark - MFMailComposeViewController delegate methods

//Called when user is done with mail interface, presents informational alert based on sending mail result.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    UIAlertView *alert = nil;
    if (result == MFMailComposeResultSent) {
        alert = [[UIAlertView alloc] initWithTitle:@"Sent" message:@"Your email was sent." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    else if (result == MFMailComposeResultFailed) {
        alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"An error occured and your email was not sent." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    
    [alert show];
    [self dismissModalViewControllerAnimated:YES];
}

//Returns NSDictionary with contacts information from plist with given name.
- (NSDictionary*)contactsInfoFromPlistNamed:(NSString*)plistName {
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"Contacts"];
    return [dictionary objectForKey:@"contactsInfo"];
}

@end
