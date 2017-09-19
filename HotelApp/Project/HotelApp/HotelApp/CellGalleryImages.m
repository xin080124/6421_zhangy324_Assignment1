//
//  CellGalleryImages.m
//  HotelApp
//
//

#import "CellGalleryImages.h"

@implementation CellGalleryImages

@synthesize images;
@synthesize buttons;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [super prepareForReuse];
    for (UIImageView *currentImage in images) {
        [currentImage setHidden:YES];
    }
    for (UIButton *currentButton in buttons) {
        [currentButton setHidden:YES];
    }
}

@end
