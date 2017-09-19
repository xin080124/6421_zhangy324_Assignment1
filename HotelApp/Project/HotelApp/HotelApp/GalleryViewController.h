//
//  GalleryViewController.h
//  HotelApp
//
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface GalleryViewController : UIViewController {
    
    NSMutableArray *arrayOfImagesAndTitles;
    NSMutableArray *arrayOfVideos;
    NSMutableArray *arrayOfVideosThumbnails;
    NSMutableArray *arrayOfImagesTitles;
    MPMoviePlayerController *moviePlayerController;
}

@property (strong, nonatomic) IBOutlet UITableView *tableViewGallery;
@property (strong, nonatomic) IBOutlet UIView *overlay;
@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UIButton *closeVideoButton;

- (IBAction)galleryItemPressed:(id)sender;
- (IBAction)closeVideo:(id)sender;

@end
