//
//  FirstTabViewController.m
//  Papyrus
//
//  Created by Tomer shiri on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstTabViewController.h"

@interface FirstTabViewController ()

@end

@implementation FirstTabViewController

-(id)init {
    self = [super init];
    if (!self) return self;
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    view.backgroundColor = [UIColor greenColor];
    return self;
}

-(void)loadView {
    [super loadView];
    [self.view addSubview:view];
}

-(int)getPosition {
    return 0;
}

-(TabVisiblityStatus) tabVisiblityStatus {
    return TabVisibleStatusSelectable;
}

-(NSString*) getTabCaption {
    return @"First Tab";
}
-(NSString*) getTabIconFileName {
    return @"icon";
}

-(void)dealloc {
    [view release];
    [super dealloc];
}

@end
