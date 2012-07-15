//
//  AppDelegate.m
//  Papyrus
//
//  Created by Tomer shiri on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabbedViewController.h"
@implementation AppDelegate

@synthesize window = _window;

static BOOL showNavigationBar = YES;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    [self.window makeKeyAndVisible];
    MainTabbedViewController* mainTabbedViewController = [[MainTabbedViewController alloc] init];
    
    if (showNavigationBar) {
        UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:self.window.rootViewController];
        self.window.rootViewController = navigationController;
        [navigationController pushViewController:mainTabbedViewController animated:NO];
        [navigationController release];
    }
    else {
        self.window.rootViewController = mainTabbedViewController;
    }
    [mainTabbedViewController release];
    
    return YES;
}

@end
