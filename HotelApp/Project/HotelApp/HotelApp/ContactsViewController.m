//
//  ContactsViewController.m
//  HotelApp
//
//

#import "ContactsViewController.h"
#import "Annotation.h"

#define kConfigPlistName @"config"

@interface ContactsViewController ()

@end

@implementation ContactsViewController
@synthesize buttonCall;
@synthesize telephoneLabel;
@synthesize buttonEmail;
@synthesize emailLabel;
@synthesize mapView;
@synthesize labelMessage;
@synthesize labelTitle;
@synthesize lableAddress;
@synthesize labelPostOffice;
@synthesize labelWebPage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Returns NSDictionary array from plist with given name.
- (NSArray*)locationsFromPlistNamed:(NSString*)plistName {
    NSMutableArray *newLocations = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"Contacts"];
    [newLocations addObjectsFromArray:[dictionary objectForKey:@"locationItems"]];
    return newLocations;
}

//Returns NSDictionary with contacts information from plist with given name.
- (NSDictionary*)contactsInfoFromPlistNamed:(NSString*)plistName {
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"Contacts"];
    return [dictionary objectForKey:@"contactsInfo"];
}

//Prepares Annotation class objects that are added to mapView.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mailComposeViewController = [[MFMailComposeViewController alloc] init];
    [mailComposeViewController setMailComposeDelegate:self];
    [mailComposeViewController.navigationBar setTintColor:[UIColor colorWithRed:200/255 green:51/255 blue:51/255 alpha:1]];
    
    locationsAnnotations = [[NSMutableArray alloc] init];
    NSArray *locations = [self locationsFromPlistNamed:kConfigPlistName];
    for (NSDictionary *location in locations) {
        Annotation *annotation = [[Annotation alloc] init];
        [annotation setTitle:[location objectForKey:@"title"]];
        [annotation setSubtitle:[location objectForKey:@"address"]];
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = [[location objectForKey:@"latitude"] floatValue];
        coordinate.longitude = [[location objectForKey:@"longitude"] floatValue];
        [annotation setCoordinate:coordinate];
        [mapView addAnnotation:annotation];
        [locationsAnnotations addObject:annotation];
        MKCoordinateRegion region;
        region.center.latitude = coordinate.latitude;
        region.center.longitude = coordinate.longitude;
        region.span.latitudeDelta = 0.03;
        region.span.longitudeDelta = 0.03;
        [mapView setRegion:region animated:TRUE];
    }
    
    NSDictionary *contactsInfo = [self contactsInfoFromPlistNamed:kConfigPlistName];
    
    [self.labelTitle setText:[contactsInfo objectForKey:@"title"]];
    [self.labelMessage setText:[contactsInfo objectForKey:@"message"]];
    [self.labelPostOffice setText:[contactsInfo objectForKey:@"postOffice"]];
    [self.labelWebPage setText:[contactsInfo objectForKey:@"webPage"]];
    buttonCall.titleLabel.textAlignment = UITextAlignmentCenter;
    buttonEmail.titleLabel.textAlignment = UITextAlignmentCenter;
    //[self.buttonCall setTitle:[[contactsInfo objectForKey:@"telephone"] stringByAppendingString:@" Call now"] forState:UIControlStateNormal];
    [telephoneLabel setText:[contactsInfo objectForKey:@"telephone"]];
    //[self.buttonEmail setTitle:[[contactsInfo objectForKey:@"email"] stringByAppendingString:@" Email us" ] forState:UIControlStateNormal];
    [emailLabel setText:[contactsInfo objectForKey:@"email"]];

}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setLabelMessage:nil];
    [self setLabelTitle:nil];
    [self setLableAddress:nil];
    [self setLabelPostOffice:nil];
    [self setLabelWebPage:nil];
    [self setButtonCall:nil];
    [self setButtonEmail:nil];
    [self setTelephoneLabel:nil];
    [self setEmailLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - MKMapView delegate methods

//Configures annotation view for each annotation as requested by mapView.
- (MKAnnotationView *)mapView:(MKMapView *)_mapView viewForAnnotation:(Annotation*)annotation{
	
	MKAnnotationView *annotationView = nil;
    annotationView =[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotation.title];
    [annotationView setCanShowCallout:YES];
    [annotationView setImage:[UIImage imageNamed:@"orange_pin.png"]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, annotationView.frame.size.width, annotationView.frame.size.height)];
    [label setText:annotation.title];
    label.center = CGPointMake(annotationView.center.x + 42, annotationView.center.y + 8) ;
    [label setTextAlignment:UITextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:8]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [annotationView addSubview:label];
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [detailButton addTarget:self action:@selector(annotationDetailsButtonPressed) forControlEvents:UIControlEventTouchDown];
    [annotationView setRightCalloutAccessoryView:detailButton];
	return annotationView;
}

//Opens Maps application when details button on annotation is tapped.
- (void)annotationDetailsButtonPressed {
    MKUserLocation *userLocation = [mapView userLocation];
    if (userLocation) {
        Annotation *selectedAnnotation = [[mapView selectedAnnotations] objectAtIndex:0];
        NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", userLocation.coordinate.latitude, userLocation.coordinate.longitude, selectedAnnotation.coordinate.latitude, selectedAnnotation.coordinate.longitude];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location error" message:@"Your location was not determined, if you have allowed this application to use your location wait for a few seconds, and than try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - buttons methods

//Called when user taps on send button, checks for possible errors and presents prefilled mail interface.
- (IBAction)buttonEmailClick:(id)sender {
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Can't send" message:@"This device is unable to send emails." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    NSDictionary *contactsInfo = [self contactsInfoFromPlistNamed:kConfigPlistName];
    [mailComposeViewController setToRecipients:[NSArray arrayWithObject:[contactsInfo objectForKey:@"email"]]];
    //[mailComposeViewController setSubject:kEmailDefaultSubject];
    //[mailComposeViewController setMessageBody:text isHTML:NO];
    [self presentModalViewController:mailComposeViewController animated:YES];
}

- (IBAction)buttonCallClick:(id)sender {
    NSDictionary *contactsInfo = [self contactsInfoFromPlistNamed:kConfigPlistName];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel://" stringByAppendingString:[contactsInfo objectForKey:@"telephone"]]]];
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

@end
