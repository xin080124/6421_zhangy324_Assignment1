//
//  FeedDownloaderDelegate.h
//  rss reader
//
//  Created by Planet1107 on 10/28/11.
//

#import <Foundation/Foundation.h>

@protocol FeedDownloaderDelegate <NSObject>

-(void)feedsDownloaded:(NSArray*)newFeeds;  //Called when feeds are downloaded from server.

@end
