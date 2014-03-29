//
//  FavoritePlacesAppDelegate.h
//  FavoritePlaces
//
//  Created by Bryan French on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapVC.h"
#import "AboutVC.h"
#import "Landmark.h"
#import "LandmarksTableVC.h"

@interface FavoritePlacesAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic,strong) NSMutableArray *landmarks;
- (void)loadData;

@end
