//
//  GenericTabbedViewController.m
//  Newsfeed
//
//  Created by Tomer shiri on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PapyrusTabbedViewController.h"
#import "ProtocolLocator.h"
#import "PapyrusTabViewControllerProtocol.h"
#import "PapyrusBasedViewControllerInstantiator.h"

@interface PapyrusTabbedViewController ()

-(void) setTabImageNamed:(NSString*)imageName withCaption:(NSString*)caption andTag:(int)_tag toViewController:(UIViewController*)viewController;

@end

@implementation PapyrusTabbedViewController

@synthesize changeTitleToTabName;

- (id)initWithTabType:(Protocol*) protocol {
    self = [self initWithTabTypes:[NSArray arrayWithObject:protocol]];
    return self;
}

- (id)initWithTabTypes:(NSArray*) protocols {
    self = [super init];
    if (!self) return self;
    
    changeTitleToTabName = YES;

    viewControllers = [[PapyrusBasedViewControllerInstantiator InstantiateViewControllersOfType:protocols] retain];
	
    for (UIViewController<PapyrusBasedViewControllerProtocol>* viewController in self.viewControllers) {
        if ([viewController respondsToSelector:@selector(registerForStatusChangeEvent:andSelector:)]) {
            [viewController registerForViewPropertiesChangeEvent:self andSelector:@selector(refreshTabs)];
        }
    }
    
    return self;
    
}

- (void) loadViewControllersOntoContainter {
    
    if (viewControllers == nil) return;
    
    NSMutableArray* visibleTabs = [NSMutableArray array];
    
    for (UIViewController<PapyrusTabViewControllerProtocol>* viewController in viewControllers) {
        if ([viewController tabVisiblityStatus] != TabVisibleStatusNotShowen)
            [visibleTabs addObject:viewController];
    }
    
    for (UIViewController<PapyrusTabViewControllerProtocol>* visibleTab in visibleTabs) {
        [self setTabImageNamed:[visibleTab getTabIconFileName] withCaption:[visibleTab getTabCaption] andTag:[visibleTab getPosition] toViewController:visibleTab];
        [[visibleTab tabBarItem] setEnabled:[visibleTab tabVisiblityStatus] == TabVisibleStatusSelectable];
    }
    self.viewControllers = [NSArray arrayWithArray:visibleTabs];
    
    if ([viewControllers count] > 0)
        [self setSelectedViewController:[visibleTabs objectAtIndex:0]];
}


- (void) refreshTabs {
    [self loadViewControllersOntoContainter];
}

//set the tab programmically

-(void)setSelectedViewController:(UIViewController *)selectedViewController {
    [super setSelectedViewController:selectedViewController];
    if (changeTitleToTabName) {
        self.title = [(UIViewController<PapyrusTabViewControllerProtocol>*)selectedViewController getTabCaption];
    }
}

//set the tab manually

-(void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (changeTitleToTabName) {
        self.title = [item title];
    }
}

-(void) setTabImageNamed:(NSString*)imageName withCaption:(NSString*)caption andTag:(int)_tag toViewController:(UIViewController*)viewController {
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:caption image:[UIImage imageNamed:imageName] tag:_tag];
    viewController.tabBarItem = item;
    [item release];
}

-(void)dealloc {
    [viewControllers release];
    [super dealloc];
}
@end
