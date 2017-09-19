//
//  FeedDownloader.m
//  rss reader
//
//  Created by Planet1107 on 10/28/11.
//

#import "FeedDownloader.h"

#define feedURL @"http://news.google.com/?output=rss"
#define feedObject @"item"
#define feedTitle @"title"
#define feedBody @"link"
#define feedDescription @"description"
#define feedDate @"pubDate"

@implementation FeedDownloader

@synthesize xmlParser;
@synthesize feeds;
@synthesize currentFeed;
@synthesize recievedString;
@synthesize feedDownloaderDelegate;


-(void)start{
    
    if (xmlParser) {
        xmlParser = nil;
    }
    
    xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:feedURL]];
    [xmlParser setDelegate:self];
    [xmlParser parse];
}

-(void)stop{
    if (xmlParser) {
        [xmlParser abortParsing];
        xmlParser = nil;
    }
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    feeds = [[NSMutableArray alloc] init];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [feedDownloaderDelegate feedsDownloaded:feeds];
    [xmlParser abortParsing];
    xmlParser = nil;
    feeds = nil;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    [feedDownloaderDelegate feedsDownloaded:nil];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
    if ([elementName isEqualToString:feedObject]) {
        if (currentFeed) {
            currentFeed = nil;
        }
        currentFeed = [[Feed alloc] init];
        return;
    }
    
    if (([elementName isEqualToString:feedTitle]||[elementName isEqualToString:feedBody]||[elementName isEqualToString:feedDate]||[elementName isEqualToString:feedDescription])&&currentFeed) {
        if (recievedString) {
            recievedString = nil;
        }
        recievedString = [[NSMutableString alloc] init];
        return;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (recievedString) {
        [recievedString appendString:string];
    }
    else{
        recievedString = [[NSMutableString alloc] initWithString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:feedObject]) {
        
        [feeds addObject:currentFeed];
        currentFeed = nil;
        return;
    }
    
    if ([elementName isEqualToString:feedTitle]&&currentFeed) {
        [currentFeed setFeedTitle:recievedString];
        recievedString = nil;
        return;
    }
    
    if ([elementName isEqualToString:feedBody]&&currentFeed) {
        [currentFeed setFeedLink:recievedString];
        recievedString = nil;
        return;
    }
    
    if ([elementName isEqualToString:feedDescription]&&currentFeed) {
        [currentFeed setFeedDescription:recievedString];
        recievedString = nil;
        return;
    }
    
    if ([elementName isEqualToString:feedDate]&&currentFeed) {
        [currentFeed setFeedDate:recievedString];
        recievedString = nil;
        return;
    }
}


@end
