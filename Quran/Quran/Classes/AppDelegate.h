//
//  AppDelegate.h
//  Quran
//
//  Created by rashid_iMac on 27/09/13.
//  Copyright (c) 2013 rashid_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelController.h"
@class HomeViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) ModelController  *modelController;
+ (ModelController*)modelController;
+(AppDelegate*) appDelegate;
@end
