//
//  CellGalleryTitle.m
//  HotelApp
//
//

#import "CellGalleryTitle.h"

@implementation CellGalleryTitle

@synthesize imageView1;
@synthesize imageView2;
@synthesize labelTitle;


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

@end
