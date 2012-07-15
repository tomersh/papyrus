//
//  FirstScrolledViewViewController.h
//  Papyrus
//
//  Created by Tomer shiri on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewForScrollviewView.h"

@interface ScrolledViewViewControllerBase : UIViewController {
    ViewForScrollviewView* view;
}

-(int) getPosition;
-(int) getHeight;
-(BOOL) isVisible;
-(void) setText:(NSString*) text;

@end
