//
//  AppDelegate.h
//  TestCategory
//
//  Created by Christine Jiang on 17/08/17.
//  Copyright © 2017 Christine Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

