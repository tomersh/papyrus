//
//  PapyrusBasedViewControllerProtocol.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PapyrusBasedViewControllerProtocol <NSObject>


//The position if the UIView in the container.

-(int) getPosition;


//The UIViewController should implement these functions if any of the protocols properties is dynamically set. 
@optional
-(void) registerForViewPropertiesChangeEvent:(id) observer andSelector:(SEL) selector;
-(void) unRegisterFromViewPropertiesChangeEvent:(id) observer;

@end
