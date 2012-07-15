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

#import "PapyrusScrollviewViewController.h"
#import "PapyrusBasedViewControllerInstantiator.h"

@interface PapyrusScrollviewViewController ()

-(void) loadViewsOfTypes:(NSArray*) protocols withStyle:(GenericBoxedViewStyle) style;

@end

@implementation PapyrusScrollviewViewController

@synthesize viewControllers;

-(id) initWithPapyrusScrollviewViewProtocol:(Protocol*) papyrusScrollviewViewProtocol andStyle:(GenericBoxedViewStyle) style {
    self = [self initWithPapyrusScrollviewViewProtocols:[NSArray arrayWithObject:papyrusScrollviewViewProtocol] andStyle:style];
    return self;
}


-(id) initWithPapyrusScrollviewViewProtocol:(Protocol*) papyrusScrollviewViewProtocol {
    self = [self initWithPapyrusScrollviewViewProtocols:[NSArray arrayWithObject:papyrusScrollviewViewProtocol]];
    return self;
    
}

-(id) initWithPapyrusScrollviewViewProtocols:(NSArray*) papyrusScrollviewViewProtocols {
    self = [self initWithPapyrusScrollviewViewProtocols:papyrusScrollviewViewProtocols andStyle:GenericBoxedViewStylePlain];
    return self;
}

-(id) initWithPapyrusScrollviewViewProtocols:(NSArray*) papyrusScrollviewViewProtocols andStyle:(GenericBoxedViewStyle) style {
    self = [super init];
    if (!self) return self;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator startAnimating];
    [self loadViewsOfTypes:papyrusScrollviewViewProtocols withStyle:style];
    return self;
}

-(void) loadViewsOfTypes:(NSArray*) protocols withStyle:(GenericBoxedViewStyle) style {
    self.viewControllers = [PapyrusBasedViewControllerInstantiator instantiateViewControllersOfType:protocols];
    
    int height = 416;
    if (style == GenericBoxedViewStyleTabbed) {
        height = 367;
    }
    scrollView = [[PapyrusScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, height)];
    scrollView.padding = 0;
}

-(void) layoutSubviewsOnView {
    [activityIndicator removeFromSuperview];
    [activityIndicator release];
    activityIndicator = nil;
    for (UIViewController<PapyrusBasedViewControllerProtocol>* viewController in viewControllers) {
        if ([viewController respondsToSelector:@selector(registerForStatusChangeEvent:andSelector:)]) {
            [viewController registerForViewPropertiesChangeEvent:self andSelector:@selector(refresh)];
        }
    }
    [self refresh];
}

-(void) refresh {
    [scrollView clearAllViews];
    for (UIViewController<PapyrusScrollviewViewProtocol>* controller in viewControllers) {
        if ([controller isVisible]) {
            controller.view.frame = CGRectMake(controller.view.frame.origin.x, controller.view.frame.origin.y, controller.view.frame.size.width, [controller getHeight]);
            [scrollView addView:controller.view];
        }
    }
}

-(NSMutableArray*) getViewControllers {
    return viewControllers;
}

-(void)loadView {
    [super loadView];
    activityIndicator.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:scrollView];
    [self.view addSubview:activityIndicator];
    [self.view bringSubviewToFront:activityIndicator];
}

-(void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


-(int)padding {
    return scrollView == nil ? 0 : scrollView.padding;
}

-(void)setPadding:(int)padding {
    if (scrollView == nil) return;
    scrollView.padding = padding;
}

-(UIColor*) backgroundColor {
    return self.view.backgroundColor;
}

-(void) setBackgroundColor:(UIColor*) color {
    self.view.backgroundColor = color;
}

-(void)dealloc {
    viewControllers = nil;
    [activityIndicator release];
    [scrollView release];
    [super dealloc];
}

@end
