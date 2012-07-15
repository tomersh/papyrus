// Papyrus - Protocol driven framework for automatic loading 
// and rendering of ViewControllers for iPhone apps.
// http://github.com/tomersh/papyrus
//
//Copyright 2012 Tomer Shiri - papyrus@shiri.info
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
// 
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

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

    viewControllers = [[PapyrusBasedViewControllerInstantiator instantiateViewControllersOfType:protocols] retain];
	
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
    self.viewControllers = visibleTabs;
    
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
