//
//  CellGalleryImages.h
//  HotelApp
//
//

#import <UIKit/UIKit.h>

@interface CellGalleryImages : UITableViewCell
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *images;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end
