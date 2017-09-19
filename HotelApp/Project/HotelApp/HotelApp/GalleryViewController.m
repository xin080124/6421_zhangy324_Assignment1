//
//  GalleryViewController.m
//  HotelApp
//
//

#import "GalleryViewController.h"
#import "CellGalleryTitle.h"
#import "CellGalleryImages.h"
#define kConfigPlistName @"config"

@interface GalleryViewController ()

@end

@implementation GalleryViewController
@synthesize tableViewGallery;
@synthesize overlay;
@synthesize bigImageView;
@synthesize closeVideoButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

//Returns NSDictionary array from plist with given name.
- (NSArray*)imagesAndTitlesFromPlistNamed:(NSString*)plistName {
    NSMutableArray *newMenus = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"Gallery"];
    [newMenus addObjectsFromArray:[dictionary objectForKey:@"imagesAndTitlesItems"]];
    return newMenus;
}

//Returns NSDictionary array from plist with given name.
- (NSArray*)imagesTitles {
    NSMutableArray *newMenus = [NSMutableArray array];
    for (NSString *title in arrayOfImagesAndTitles) {
        
        if (![title hasSuffix:@".png"]) {
            [newMenus addObject:title];
        }
    }
    return newMenus;
}



//Returns NSDictionary array from plist with given name.
- (NSArray*)videosFromPlistNamed:(NSString*)plistName {
    NSMutableArray *newMenus = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    dictionary = [dictionary objectForKey:@"Root"];
    dictionary = [dictionary objectForKey:@"Gallery"];
    [newMenus addObjectsFromArray:[dictionary objectForKey:@"videosItems"]];
    return newMenus;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    arrayOfImagesAndTitles = [[NSMutableArray alloc] initWithArray:[self imagesAndTitlesFromPlistNamed:kConfigPlistName]];
    arrayOfImagesTitles = [[NSMutableArray alloc] initWithArray:[self imagesTitles]];
    arrayOfVideos = [[NSMutableArray alloc] initWithArray:[self videosFromPlistNamed:kConfigPlistName]];
    
    tableViewGallery.separatorColor = [UIColor clearColor];
    
    [bigImageView setContentMode:UIViewContentModeScaleAspectFit];
    [bigImageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnItemBigImageDetected:)];
    [bigImageView addGestureRecognizer:tapGestureRecognizer];
    
    moviePlayerController = [[MPMoviePlayerController alloc] init];
    [[moviePlayerController view] setAlpha:0.0f];
    [[moviePlayerController view] setFrame:[overlay frame]];
    [self.view addSubview:[moviePlayerController view]];
    [self.view bringSubviewToFront:closeVideoButton];
    
    arrayOfVideosThumbnails = [[NSMutableArray alloc] initWithCapacity:[arrayOfVideos count]];
    for (NSString *videoName in arrayOfVideos) {
        NSArray *fileNameComponens = [videoName componentsSeparatedByString:@"."];
        if ([fileNameComponens count] == 2) {
            NSURL *movieURL = [[NSBundle mainBundle] URLForResource:[fileNameComponens objectAtIndex:0] withExtension:[fileNameComponens lastObject]];
            [moviePlayerController setContentURL:movieURL];
            UIImage *thumbnail = [moviePlayerController thumbnailImageAtTime:1 timeOption:MPMovieTimeOptionNearestKeyFrame];
            if (thumbnail) {
                [arrayOfVideosThumbnails addObject:thumbnail];
                continue;
            }
        }
        [arrayOfVideosThumbnails addObject:[UIImage imageNamed:@"img_nophoto.png"]];
    }
}

- (void)viewDidUnload
{
    [moviePlayerController stop];
    [[moviePlayerController view] removeFromSuperview];
    moviePlayerController = nil;
    [self setTableViewGallery:nil];
    [self setOverlay:nil];
    [self setBigImageView:nil];
    [self setCloseVideoButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        int num = 0;
        int numberOfImagesInCurrentCell = 0;
        for (NSString *item in arrayOfImagesAndTitles) {
            if (![item hasSuffix:@".png"]) {
                ++num;
                numberOfImagesInCurrentCell = 0;
            }
            else {
                if (numberOfImagesInCurrentCell == 0) {
                    ++num;
                }
                ++numberOfImagesInCurrentCell;
                if (numberOfImagesInCurrentCell == 4) {
                    numberOfImagesInCurrentCell = 0;
                }
            }
        }
        return num;
    }
    
    else if (section == 1){
        return [arrayOfVideos count];
    }
    
    else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath section] == 0) {
        int index = -1;
        int correctedIndex = -1;
        int maxNumberOfImagesInCell = 4;
        NSString *item = nil;
        for (item in arrayOfImagesAndTitles) {
            ++correctedIndex;
            if (![item hasSuffix:@".png"]) {
                ++index;
                maxNumberOfImagesInCell = 4;
            }
            else {
                if (maxNumberOfImagesInCell == 4) {
                    ++index;
                }
                --maxNumberOfImagesInCell;
                if (maxNumberOfImagesInCell == 0) {
                    maxNumberOfImagesInCell = 4;
                }
            }
            if (index == indexPath.row) {
                break;
            }
        }
        
        if (![item hasSuffix:@".png"]) {
            return 30;
        }    
        else {
            return 56;
        }
    }
    return 56;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath section] == 0) {
        static NSString *cellGaleryTitleId = @"CellGalleryTitle";
        static NSString *cellGaleryImagesId = @"CellGalleryImages";
        
        int index = -1;
        int correctedIndex = -1;
        int maxNumberOfImagesInCell = 4;
        NSString *item = nil;
        for (item in arrayOfImagesAndTitles) {
            ++correctedIndex;
            if (![item hasSuffix:@".png"]) {
                ++index;
                maxNumberOfImagesInCell = 4;
            }
            else {
                if (maxNumberOfImagesInCell == 4) {
                    ++index;
                }
                --maxNumberOfImagesInCell;
                if (maxNumberOfImagesInCell == 0) {
                    maxNumberOfImagesInCell = 4;
                }
            }
            if (index == indexPath.row) {
                break;
            }
        }
        
        if (![item hasSuffix:@".png"]) {
            CellGalleryTitle *cell = [tableView dequeueReusableCellWithIdentifier:cellGaleryTitleId];
            [cell.labelTitle setText:item];
            return cell;
        }    
        else {
            CellGalleryImages *cell = [tableView dequeueReusableCellWithIdentifier:cellGaleryImagesId];
            
            for (int i = 0; i < 4; i++) {
                if (correctedIndex + i < [arrayOfImagesAndTitles count]) {
                    if (![[arrayOfImagesAndTitles objectAtIndex:correctedIndex+i] hasSuffix:@".png"]) {
                        break;
                    }
                    NSString *imageName = [arrayOfImagesAndTitles objectAtIndex:correctedIndex+i];
                    UIButton *button = [cell.buttons objectAtIndex:i];
                    [button setHidden:NO];
                    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                    UIImageView *imageView = [cell.images objectAtIndex:i];
                    [imageView setHidden:NO];
                }
            }
            return cell;
        }
    }
    else {
        static NSString *cellGaleryImagesId = @"CellGalleryImages";
        
        CellGalleryImages *cell = [tableView dequeueReusableCellWithIdentifier:cellGaleryImagesId];
        
        int limit = indexPath.row * 4 + 4;
        int index = 0;
        for (int i = indexPath.row * 4; i < limit; i++) {
            if (i < [arrayOfVideosThumbnails count]) {
                UIButton *button = [cell.buttons objectAtIndex:index];
                [button setHidden:NO];
                [button setTag:i+1];
                [button setBackgroundImage:[arrayOfVideosThumbnails objectAtIndex:i] forState:UIControlStateNormal];
                UIImageView *imageView = [cell.images objectAtIndex:index];
                [imageView setHidden:NO];
                ++index;
            }
        }
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 42)];
    
    if (section == 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photos_title.png"]];
        imageView.center = view.center;
        [view addSubview:imageView];
        return view;
    }
    
    else {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"videos_title.png"]];
        imageView.center = view.center;
        [view addSubview:imageView];
        return view;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transparent_bg_1px@2x.png"]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer   shouldReceiveTouch:(UITouch *)touch {
    
    if (((UIImageView*)gestureRecognizer.view).image) {
        return YES;
    }
    else {
        return NO;
    }
}


- (IBAction)galleryItemPressed:(id)sender {
    if ([sender tag] == 0) {
        [bigImageView setImage:[sender backgroundImageForState:UIControlStateNormal]];
        [self.view setUserInteractionEnabled:NO];
        [UIView animateWithDuration:0.2
                              delay:0.0
                            options: UIViewAnimationCurveEaseOut
                         animations:^{
                             [overlay setAlpha:1.0];
                             [bigImageView setAlpha:1.0];
                             [bigImageView setFrame:CGRectMake(10.0f, self.view.frame.size.height/2 - 150.0f, 300.0f, 300.0f)];
                             
                         } 
                         completion:^(BOOL finished){
                             [self.view setUserInteractionEnabled:YES];
                         }];
    }
    else {
        [self.view setUserInteractionEnabled:NO];
        [UIView animateWithDuration:0.2
                              delay:0.0
                            options: UIViewAnimationCurveEaseOut
                         animations:^{
                             [closeVideoButton setAlpha:1.0];
                             [overlay setAlpha:1.0];
                             [bigImageView setAlpha:1.0];
                             [bigImageView setFrame:CGRectMake(10.0f, self.view.frame.size.height/2 - 150.0f, 300.0f, 300.0f)];
                             [[moviePlayerController view] setAlpha:1.0];
                         } 
                         completion:^(BOOL finished){
                             [self.view setUserInteractionEnabled:YES];
                             if ([sender tag]-1 < [arrayOfVideos count]) {
                                 NSArray *fileNameComponens = [[arrayOfVideos objectAtIndex:[sender tag]-1] componentsSeparatedByString:@"."];
                                 if ([fileNameComponens count] == 2) {
                                     NSURL *movieURL = [[NSBundle mainBundle] URLForResource:[fileNameComponens objectAtIndex:0] withExtension:[fileNameComponens lastObject]];
                                     [moviePlayerController setContentURL:movieURL];
                                     [moviePlayerController play];
                                 }
                             }
                         }];
    }
}

- (void)tapOnItemBigImageDetected:(UITapGestureRecognizer*)tapGestureRecognizer {
    if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self.view setUserInteractionEnabled:NO];
        [UIView animateWithDuration:0.2
                              delay:0.0
                            options: UIViewAnimationCurveEaseOut
                         animations:^{
                             [overlay setAlpha:0.0];
                             [bigImageView setAlpha:0.0];
                             [bigImageView setFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 0.0f, 0.0f)];
                             
                         } 
                         completion:^(BOOL finished){
                             [self.view setUserInteractionEnabled:YES];
                         }];
    }
}

- (IBAction)closeVideo:(id)sender {
    [self.view setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [closeVideoButton setAlpha:0.0];
                         [overlay setAlpha:0.0];
                         [bigImageView setAlpha:0.0];
                         [bigImageView setFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 0.0f, 0.0f)];
                         [[moviePlayerController view] setAlpha:0.0];
                         
                     } 
                     completion:^(BOOL finished){
                         [self.view setUserInteractionEnabled:YES];
                         [moviePlayerController stop];
                     }];
}

@end
