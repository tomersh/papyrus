//
//  TabViewProtocol.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocolBasedViewControllerProtocol.h"

typedef enum TabVisiblityStatus {
    TabVisibleStatusSelectable = 1,     //tab is selectable
    TabVisibleStatusDisabled = 2,   //tab is disabled
    TabVisibleStatusNotShowen = 3   //tab is not showen
}TabVisiblityStatus;

@protocol TabViewControllerProtocol <ProtocolBasedViewControllerProtocol>

-(TabVisiblityStatus) tabVisiblityStatus;

-(NSString*) getTabCaption;
-(NSString*) getTabIconFileName;

@end
