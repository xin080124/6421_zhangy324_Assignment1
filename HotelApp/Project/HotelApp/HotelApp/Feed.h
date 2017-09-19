//
//  Feed.h
//  rss reader
//
//  Created by Planet1107 on 10/28/11.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject{
    NSString *feedTitle;
    NSString *feedLink;
    NSString *feedDescription;
    NSString *feedDate;
}

@property(nonatomic, retain) NSString *feedTitle;
@property(nonatomic, retain) NSString *feedLink;
@property(nonatomic, retain) NSString *feedDescription;
@property(nonatomic, retain) NSString *feedDate;

@end
