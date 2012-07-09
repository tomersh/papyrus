//
//  GenericProtocolBasedViewController.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProtocolBasedViewControllerInstantiator : NSObject

+(NSMutableArray*) InstantiateViewControllersOfType:(NSArray*) protocols;

@end
