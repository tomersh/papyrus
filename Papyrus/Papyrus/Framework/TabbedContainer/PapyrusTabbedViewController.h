//
//  GenericTabbedViewController.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "TabViewControllerProtocol.h"

@interface GenericTabbedViewController : UITabBarController {
    
    NSArray* viewControllers;
    BOOL changeTitleToTabName;
}

@property (nonatomic,assign) BOOL changeTitleToTabName;


- (id)initWithTabType:(Protocol*) protocol;
- (id)initWithTabTypes:(NSArray*) protocols;

- (void) loadViewControllersOntoContainter;
- (void) refreshTabs;


@end
