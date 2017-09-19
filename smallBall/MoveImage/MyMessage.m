//
//  MyMessage.m
//  MoveImage
//
//  Created by 商 文博 on 12-12-2.
//  Copyright (c) 2012年 商 文博. All rights reserved.
//

#import "MyMessage.h"

@implementation MyMessage

static MyMessage *sharedMyMessage = nil;

+(id)instance
{
    if (nil == sharedMyMessage)
    {
        sharedMyMessage = [[MyMessage alloc] init];
    }
    return sharedMyMessage;
}

@end
