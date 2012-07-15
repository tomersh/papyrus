//
//  FirstScrolledViewViewController.m
//  Papyrus
//
//  Created by Tomer shiri on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScrolledViewViewControllerBase.h"

@interface ScrolledViewViewControllerBase ()

@end

@implementation ScrolledViewViewControllerBase

-(int) getPosition {
    return 0;
}

-(int) getHeight {
    return view == nil ? 0 : view.frame.size.height;
}

-(BOOL) isVisible {
    return view != nil;
}

-(id)init {
    self = [super init];
    if (!self) return self;
    view = [[ViewForScrollviewView alloc] init];
    return self;
}

-(void)loadView {
    [super loadView];
    [self.view addSubview:view]; 
}

-(void)setText:(NSString *)text {
    if (view == nil) return;
    [view setText:text];
}


-(void)dealloc {
    [view release];
    [super dealloc];
}

@end
