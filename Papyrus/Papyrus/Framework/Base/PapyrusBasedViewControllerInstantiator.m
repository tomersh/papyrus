// Papyrus - Protocol driven framework for automatic loading 
// and rendering of ViewControllers for iPhone apps.
// http://github.com/tomersh/papyrus
//
//Copyright 2012 Tomer Shiri - papyrus@shiri.info
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
// 
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

#import "PapyrusBasedViewControllerInstantiator.h"
#import "ProtocolLocator.h"
#import "PapyrusBasedViewControllerProtocol.h"

@interface PapyrusBasedViewControllerInstantiator ()

+(NSMutableSet*) fetchProtocols:(NSArray*) protocols;
+(NSMutableArray*) createViewControllerInstances:(NSMutableSet*) setOfClasses;
+(void) arrangeViewControllersPosition:(NSMutableArray*) viewControllers;

@end

@implementation PapyrusBasedViewControllerInstantiator

+(NSMutableArray*) instantiateViewControllersOfType:(NSArray*) protocols {
    
    if (protocols == nil) return [[[NSMutableArray alloc] init] autorelease];
    
    NSMutableSet* protocolImplementingClasses = [PapyrusBasedViewControllerInstantiator fetchProtocols:protocols];
    
    NSMutableArray* viewControllersInstances = [[PapyrusBasedViewControllerInstantiator createViewControllerInstances:protocolImplementingClasses] retain];
    
    [PapyrusBasedViewControllerInstantiator arrangeViewControllersPosition:viewControllersInstances];
    
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

+(NSMutableArray*) createViewControllerInstances:(NSMutableSet*) setOfClasses {
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
        int vc1Pos = [(NSObject<PapyrusBasedViewControllerProtocol>*)vc1 getPosition];
        int vc2Pos = [(NSObject<PapyrusBasedViewControllerProtocol>*)vc2 getPosition];
        return vc1Pos < vc2Pos ? NSOrderedAscending : NSOrderedDescending;
    }];
}

@end
