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
    NSMutableSet* protocolImplementingClasses = [ProtocolBasedViewControllerInstantiator fetchProtocols:protocols];
    
    NSMutableArray* viewControllersInstances = [[ProtocolBasedViewControllerInstantiator CreateViewControllerInstances:protocolImplementingClasses] retain];
    
    [ProtocolBasedViewControllerInstantiator arrangeViewControllersPosition:viewControllersInstances];
    
    return [viewControllersInstances autorelease];
}


+(NSMutableSet*) fetchProtocols:(NSArray*) protocols {
    if (protocols == nil) return nil;
    NSMutableSet* tabs = [[NSMutableSet alloc] init];
    for (Protocol* protocol in protocols) {
        [tabs addObjectsFromArray:[ProtocolLocator getAllClassesByProtocolType:protocol]];
    }
    return [tabs autorelease];
}

+(NSMutableArray*) CreateViewControllerInstances:(NSMutableSet*) setOfClasses {
    if (setOfClasses == nil) return nil;
    NSMutableArray* viewControllers = [[NSMutableArray alloc] initWithCapacity:[setOfClasses count]];
    for (Class tabClazz in setOfClasses) {
        UIViewController* tabInstance = (UIViewController*)[[tabClazz alloc] init];
        if ([tabInstance isKindOfClass:[UIViewController class]]) {
            [viewControllers addObject:tabInstance];
        }
        [tabInstance release];
    }
    return [viewControllers autorelease];
}

+(void) arrangeViewControllersPosition:(NSMutableArray*) viewControllers {
    if (viewControllers == nil) return;
    [viewControllers sortUsingComparator:^NSComparisonResult(id tab1, id tab2) {
        int tab1Pos = [(NSObject<ProtocolBasedViewControllerProtocol>*)tab1 getPosition];
        int tab2Pos = [(NSObject<ProtocolBasedViewControllerProtocol>*)tab2 getPosition];
        return tab1Pos < tab2Pos ? NSOrderedAscending : NSOrderedDescending;
    }];
}

@end
