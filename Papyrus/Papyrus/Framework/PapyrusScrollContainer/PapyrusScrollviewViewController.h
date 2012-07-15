//
//  GenericBoxedViewController.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PapyrusScrollView.h"
#import "PapyrusScrollviewViewProtocol.h"

typedef enum GenericBoxedViewStyle {
    GenericBoxedViewStyleTabbed = 1,
    GenericBoxedViewStylePlain = 2
}GenericBoxedViewStyle;

@interface PapyrusScrollviewViewController : UIViewController {
    
    NSMutableArray* viewControllers;
    PapyrusScrollView* scrollView;
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic,copy) UIColor* backgroundColor;
@property (nonatomic) int padding;
@property (nonatomic,retain) NSMutableArray* viewControllers;

-(id) initWithPapyrusScrollviewViewProtocol:(Protocol*) papyrusScrollviewViewProtocol andStyle:(GenericBoxedViewStyle) style;
-(id) initWithPapyrusScrollviewViewProtocols:(NSArray*) papyrusScrollviewViewProtocols andStyle:(GenericBoxedViewStyle) style;

-(id) initWithPapyrusScrollviewViewProtocol:(Protocol*) papyrusScrollviewViewProtocol;
-(id) initWithPapyrusScrollviewViewProtocols:(NSArray*) papyrusScrollviewViewProtocols;

-(NSMutableArray*) getViewControllers;
-(void) refresh;
-(void) layoutSubviewsOnView;
@end
