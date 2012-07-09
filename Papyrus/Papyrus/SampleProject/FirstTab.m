//
//  FirstTab.m
//  Papyrus
//
//  Created by Tomer shiri on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstTab.h"

@interface FirstTab ()

@end

@implementation FirstTab

-(void)loadView {
    self.view.backgroundColor = [UIColor greenColor];
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

@end
