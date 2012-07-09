//
//  ProtocolBasedViewControllerProtocol.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtocolBasedViewControllerProtocol <NSObject>

-(int) getPosition;

@optional
-(void) registerForStatusChangeEvent:(id) observer andSelector:(SEL) selector;
-(void) unRegisterForStatusChangeEvent:(id) observer;

@end
