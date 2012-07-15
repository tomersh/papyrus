//
//  SecondTabViewController.m
//  Papyrus
//
//  Created by Tomer shiri on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondTabViewController.h"

@interface SecondTabViewController ()

@end

@implementation SecondTabViewController

-(id)init {
    self = [super init];
    if (!self) return self;
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    view.backgroundColor = [UIColor blueColor];
    return self;
}

-(void)loadView {
    [super loadView];
    [self.view addSubview:view];
}

-(int)getPosition {
    return 1;
}

-(TabVisiblityStatus) tabVisiblityStatus {
    return TabVisibleStatusSelectable;
}

-(NSString*) getTabCaption {
    return @"Second Tab";
}
-(NSString*) getTabIconFileName {
    return @"chicken";
}

-(void)dealloc {
    [view release];
    [super dealloc];
}

@end
