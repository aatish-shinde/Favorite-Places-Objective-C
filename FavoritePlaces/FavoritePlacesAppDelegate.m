//
//  FavoritePlacesAppDelegate.m
//  FavoritePlaces
//
//  Created by Bryan French on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoritePlacesAppDelegate.h"

@implementation FavoritePlacesAppDelegate

@synthesize window = _window,tabBarController,landmarks;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    [self loadData];
    tabBarController = [[UITabBarController alloc] init];
    MapVC *mapVC = [[MapVC alloc] initWithNibName:nil bundle:nil];
    mapVC.landmarks = landmarks;
    mapVC.title = @"Map";
    AboutVC *aboutVC = [[AboutVC alloc] initWithNibName:nil bundle:nil];
    aboutVC.title = @"About";
    
    LandmarksTableVC *landmarkTableVC = [[LandmarksTableVC alloc] initWithNibName:nil bundle:nil];
    landmarkTableVC.landmarks = landmarks;
    landmarkTableVC.title = @"Landmarks";

    // icons
    UITabBarItem *mapItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"72-pin.png"] tag:0];
    UITabBarItem *aboutItem = [[UITabBarItem alloc] initWithTitle:@"About" image:[UIImage imageNamed:@"eye.png"] tag:0];
    UITabBarItem *landmark = [[UITabBarItem alloc] initWithTitle:@"Landmark" image:[UIImage imageNamed:@"eye.png"] tag:0];
    //
    mapVC.tabBarItem = mapItem;
    aboutVC.tabBarItem = aboutItem;
    landmarkTableVC.tabBarItem = landmark;
    
    NSArray *viewControllers = [NSArray arrayWithObjects:mapVC,aboutVC, landmarkTableVC, nil];
    tabBarController.viewControllers = viewControllers;
    [self.window addSubview:tabBarController.view];

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loadData{
    self.landmarks = [NSMutableArray array];
    // Load Landmarks
    NSString *path = [[NSBundle mainBundle] pathForResource:@"landmarks" ofType:@"plist"];
    //  NSLog(@"path=%@",path);
    
    NSDictionary *tempDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    //  NSLog(@"tempDictionary=%@",tempDictionary);
    
    NSArray *tempArray = [tempDictionary objectForKey:@"landmarks"];
    // loop through array and create landmark and log them out
    for (id dict in tempArray) {
        //NSLog(@"dict=%@",dict);
        NSString *name = [dict objectForKey:@"name"];
        NSString *state = [dict objectForKey:@"state"];
        float latitude = [[dict objectForKey:@"latitude"] floatValue];
        float longitude = [[dict objectForKey:@"longitude"] floatValue];
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        Landmark *lm = [[Landmark alloc] initWithName:name state:state coordinate:coordinate];
        [self.landmarks addObject:lm];
    }
    
    NSLog(@"there are %d landmarks",[self.landmarks count]);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
