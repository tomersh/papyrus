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

-(id) initWithBoxViewProtocol:(Protocol*) _boxViewProtocol andStyle:(GenericBoxedViewStyle) style;
-(id) initWithBoxViewProtocols:(NSArray*) _boxViewProtocol andStyle:(GenericBoxedViewStyle) style;

-(id) initWithBoxViewProtocol:(Protocol*) _boxViewProtocol;
-(id) initWithBoxViewProtocols:(NSArray*) _boxViewProtocol;

-(NSMutableArray*) getViewControllers;
-(void) refresh;
-(void) layoutSubviewsOnView;
@end
