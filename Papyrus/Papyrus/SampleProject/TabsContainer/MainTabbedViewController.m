//
//  MainTabbedViewController.m
//  Papyrus
//
//  Created by Tomer shiri on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainTabbedViewController.h"
#import "MainTabbedContainerProtocol.h"

@interface MainTabbedViewController ()

@end

@implementation MainTabbedViewController


-(id)init {
    self = [super initWithTabType:@protocol(MainTabbedContainerProtocol)];
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadViewControllersOntoContainter];
}

@end
