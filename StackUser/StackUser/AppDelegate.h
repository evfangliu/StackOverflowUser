//
//  AppDelegate.h
//  StackUser
//
//  Created by Fangzhou Liu on 11/28/17.
//  Copyright © 2017 Evan Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

