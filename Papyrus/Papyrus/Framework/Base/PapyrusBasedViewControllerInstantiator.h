//
//  GenericProtocolBasedViewController.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PapyrusBasedViewControllerInstantiator : NSObject

//Creates an array of view controllers that conforms to the protocols in protocols.

+(NSMutableArray*) InstantiateViewControllersOfType:(NSArray*) protocols;

@end
