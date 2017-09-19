//
//  FeedDownloader.h
//  rss reader
//
//  Created by Planet1107 on 10/28/11.
//

#import <Foundation/Foundation.h>
#import "FeedDownloaderDelegate.h"
#import "Feed.h"

@interface FeedDownloader : NSObject <NSXMLParserDelegate>{
}

@property(strong, nonatomic) NSXMLParser *xmlParser;
@property(strong, nonatomic) NSMutableArray *feeds;
@property(strong, nonatomic) Feed *currentFeed;
@property(strong, nonatomic) NSMutableString *recievedString;
@property(strong, nonatomic) id<FeedDownloaderDelegate> feedDownloaderDelegate;

-(void)start;   //called to start downloading rss feeds

-(void)stop;    //called to interrupt download of rss feeds

@end
