//
//  AppDelegate.m
//  HotelApp
//
//

#import "AppDelegate.h"

#define kTabBarAboutTag 1001
#define kTabBarGalleryTag 1002
#define kTabBarNewsTag 1003
#define kTabBarReservationTag 1004
#define kTabBarContactsTag 1005

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UITabBarController *tabBarController = (UITabBarController*)[_window rootViewController];
    
    // about button
    [tabBarController setSelectedIndex:0];
    UIImage *buttonImageNormalAbout = [UIImage imageNamed:@"tab-about-h.png"];
    UIImage *buttonImageHighlightAbout = [UIImage imageNamed:@"tab-about-h.png"];
    UIButton *buttonAbout = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonAbout setTag:kTabBarAboutTag];
    [buttonAbout addTarget:self action:@selector(switchTabBar:) forControlEvents:UIControlEventTouchDown];
    [buttonAbout setFrame:CGRectMake(0.0f, 428.0f, buttonImageNormalAbout.size.width, buttonImageNormalAbout.size.height)];
    [buttonAbout setBackgroundImage:buttonImageNormalAbout forState:UIControlStateNormal];
    [buttonAbout setBackgroundImage:buttonImageHighlightAbout forState:UIControlStateHighlighted];
    [tabBarController.view addSubview:buttonAbout];
    
    // gallery button
    UIImage *buttonImageNormalGallery = [UIImage imageNamed:@"tab-gallery.png"];
    UIImage *buttonImageHighlightGallery = [UIImage imageNamed:@"tab-gallery-h.png"];
    UIButton *buttonGallery = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonGallery setTag:kTabBarGalleryTag];
    [buttonGallery addTarget:self action:@selector(switchTabBar:) forControlEvents:UIControlEventTouchDown];
    [buttonGallery setFrame:CGRectMake(64.0f, 428.0f, buttonImageNormalGallery.size.width, buttonImageNormalGallery.size.height)];
    [buttonGallery setBackgroundImage:buttonImageNormalGallery forState:UIControlStateNormal];
    [buttonGallery setBackgroundImage:buttonImageHighlightGallery forState:UIControlStateHighlighted];
    [tabBarController.view addSubview:buttonGallery];
    
    // news button
    UIImage *buttonImageNormalNews = [UIImage imageNamed:@"tab-news.png"];
    UIImage *buttonImageHighlightNews = [UIImage imageNamed:@"tab-news-h.png"];
    UIButton *buttonNews = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonNews setTag:kTabBarNewsTag];
    [buttonNews addTarget:self action:@selector(switchTabBar:) forControlEvents:UIControlEventTouchDown];
    [buttonNews setFrame:CGRectMake(128.0f, 428.0f, buttonImageNormalNews.size.width, buttonImageNormalNews.size.height)];
    [buttonNews setBackgroundImage:buttonImageNormalNews forState:UIControlStateNormal];
    [buttonNews setBackgroundImage:buttonImageHighlightNews forState:UIControlStateHighlighted];
    [tabBarController.view addSubview:buttonNews];
    
    // reservation button
    UIImage *buttonImageNormalReservation = [UIImage imageNamed:@"tab-reservation.png"];
    UIImage *buttonImageHighlightReservation = [UIImage imageNamed:@"tab-reservation-h.png"];
    UIButton *buttonReservation = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReservation setTag:kTabBarReservationTag];
    [buttonReservation addTarget:self action:@selector(switchTabBar:) forControlEvents:UIControlEventTouchDown];
    [buttonReservation setFrame:CGRectMake(192.0f, 428.0f, buttonImageNormalReservation.size.width, buttonImageNormalReservation.size.height)];
    [buttonReservation setBackgroundImage:buttonImageNormalReservation forState:UIControlStateNormal];
    [buttonReservation setBackgroundImage:buttonImageHighlightReservation forState:UIControlStateHighlighted];
    [tabBarController.view addSubview:buttonReservation];
    
    // contacts button
    UIImage *buttonImageNormalContacts = [UIImage imageNamed:@"tab-contacts.png"];
    UIImage *buttonImageHighlightContacts = [UIImage imageNamed:@"tab-contacts-h.png"];
    UIButton *buttonContacts = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonContacts setTag:kTabBarContactsTag];
    [buttonContacts addTarget:self action:@selector(switchTabBar:) forControlEvents:UIControlEventTouchDown];
    [buttonContacts setFrame:CGRectMake(256.0f, 428.0f, buttonImageNormalContacts.size.width, buttonImageNormalContacts.size.height)];
    [buttonContacts setBackgroundImage:buttonImageNormalContacts forState:UIControlStateNormal];
    [buttonContacts setBackgroundImage:buttonImageHighlightContacts forState:UIControlStateHighlighted];
    [tabBarController.view addSubview:buttonContacts];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Button methods

- (IBAction)switchTabBar:(id)sender
{
    UITabBarController *tabBarController = (UITabBarController*)[_window rootViewController];
    switch ([(UIButton *)sender tag]) {
        case kTabBarAboutTag:
            for (UIView *subview in [tabBarController.view subviews]) {
                if (subview.tag == kTabBarAboutTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about-h.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarGalleryTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarNewsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarReservationTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarContactsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts-h.png"] forState:UIControlStateHighlighted];
                }
            }
            [tabBarController setSelectedIndex:0];
            break;
        case kTabBarGalleryTag:
            for (UIView *subview in [tabBarController.view subviews]) {
                if (subview.tag == kTabBarAboutTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarGalleryTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery-h.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarNewsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarReservationTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarContactsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts-h.png"] forState:UIControlStateHighlighted];
                }
            }
            [tabBarController setSelectedIndex:1];
            break;
        case kTabBarNewsTag:
            for (UIView *subview in [tabBarController.view subviews]) {
                if (subview.tag == kTabBarAboutTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarGalleryTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarNewsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news-h.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarReservationTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarContactsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts-h.png"] forState:UIControlStateHighlighted];
                }
            }
            [tabBarController setSelectedIndex:2];
            break;
        case kTabBarReservationTag:
            for (UIView *subview in [tabBarController.view subviews]) {
                if (subview.tag == kTabBarAboutTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarGalleryTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarNewsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarReservationTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation-h.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarContactsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts-h.png"] forState:UIControlStateHighlighted];
                }
            }
            [tabBarController setSelectedIndex:3];            
            break;
        case kTabBarContactsTag:
            for (UIView *subview in [tabBarController.view subviews]) {
                if (subview.tag == kTabBarAboutTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-about-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarGalleryTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-gallery-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarNewsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-news-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarReservationTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-reservation-h.png"] forState:UIControlStateHighlighted];
                }
                if (subview.tag == kTabBarContactsTag) {
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts-h.png"] forState:UIControlStateNormal];
                    [(UIButton *)subview setImage:[UIImage imageNamed:@"tab-contacts-h.png"] forState:UIControlStateHighlighted];
                }
            }
            [tabBarController setSelectedIndex:4];            
            break;
        default:
            break;
    }
}

@end
