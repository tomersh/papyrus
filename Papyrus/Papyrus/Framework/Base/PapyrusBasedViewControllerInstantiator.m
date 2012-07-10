//
//  GenericProtocolBasedViewController.m
//  Newsfeed
//
//  Created by Tomer shiri on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProtocolBasedViewControllerInstantiator.h"
#import "ProtocolLocator.h"
#import "ProtocolBasedViewControllerProtocol.h"

@interface ProtocolBasedViewControllerInstantiator ()

+(NSMutableSet*) fetchProtocols:(NSArray*) protocols;
+(NSMutableArray*) CreateViewControllerInstances:(NSMutableSet*) setOfClasses;
+(void) arrangeViewControllersPosition:(NSMutableArray*) viewControllers;

@end

@implementation ProtocolBasedViewControllerInstantiator

+(NSMutableArray*) InstantiateViewControllersOfType:(NSArray*) protocols {
    
    if (protocols == nil) return [[[NSMutableArray alloc] init] autorelease];
    
    NSMutableSet* protocolImplementingClasses = [ProtocolBasedViewControllerInstantiator fetchProtocols:protocols];
    
    NSMutableArray* viewControllersInstances = [[ProtocolBasedViewControllerInstantiator CreateViewControllerInstances:protocolImplementingClasses] retain];
    
    [ProtocolBasedViewControllerInstantiator arrangeViewControllersPosition:viewControllersInstances];
    
    return [viewControllersInstances autorelease];
}


+(NSMutableSet*) fetchProtocols:(NSArray*) protocols {
    NSMutableSet* controllers = [[NSMutableSet alloc] init];
    if (protocols == nil) return [controllers autorelease];
    for (Protocol* protocol in protocols) {
        [controllers addObjectsFromArray:[ProtocolLocator getAllClassesByProtocolType:protocol]];
    }
    return [controllers autorelease];
}

+(NSMutableArray*) CreateViewControllerInstances:(NSMutableSet*) setOfClasses {
    if (setOfClasses == nil) return [[[NSMutableArray alloc] init] autorelease];
    NSMutableArray* viewControllers = [[NSMutableArray alloc] initWithCapacity:[setOfClasses count]];
    for (Class viewControllerClazz in setOfClasses) {
        UIViewController* viewControllerInstance = (UIViewController*)[[viewControllerClazz alloc] init];
        if ([viewControllerInstance isKindOfClass:[UIViewController class]]) {
            [viewControllers addObject:viewControllerInstance];
        }
        [viewControllerInstance release];
    }
    return [viewControllers autorelease];
}

+(void) arrangeViewControllersPosition:(NSMutableArray*) viewControllers {
    if (viewControllers == nil) return;
    [viewControllers sortUsingComparator:^NSComparisonResult(id vc1, id vc2) {
        int vc1Pos = [(NSObject<ProtocolBasedViewControllerProtocol>*)vc1 getPosition];
        int vc2Pos = [(NSObject<ProtocolBasedViewControllerProtocol>*)vc2 getPosition];
        return vc1Pos < vc2Pos ? NSOrderedAscending : NSOrderedDescending;
    }];
}

@end
