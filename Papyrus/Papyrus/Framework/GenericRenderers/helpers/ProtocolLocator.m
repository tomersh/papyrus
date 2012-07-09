//
//  InterfaceLocator.m
//  Newsfeed
//
//  Created by Tomer Shiri on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ProtocolLocator.h"
#import "objc/runtime.h"

@interface  ProtocolLocator () 

+ (Class) getRequestByProtocol:(Protocol*) protocol withType:(int) type;
+ (void) saveClass:(Class)class forProtocol:(Protocol*) protocol withType:(int) type;
+ (NSString*) getKeyForProtocol:(Protocol*) protocol withType:(int) type;

@end
@implementation ProtocolLocator

static Class* allClassesMemoization = NULL; 
static int allClassCount;

static NSMutableDictionary* requestMemoization;


+(Class) getClassByProtocolType:(Protocol*) protocol withType:(int) type {
    if (protocol == nil)
        return nil;
    Class c = [ProtocolLocator getRequestByProtocol:protocol withType:type];
    if (c != nil)
        return c;
    NSArray* classes = [self getAllClassesByProtocolType:protocol];
    for (Class obj in classes) {
        if (obj == nil || ![obj respondsToSelector:@selector(getTypeForObject)]) continue;
        int objType = (int)[obj performSelector:@selector(getTypeForObject)];
        [ProtocolLocator saveClass:obj forProtocol:protocol withType:objType];
        if (objType == type)
            return obj;
    }
    return nil;
}

+(NSArray *) getAllClassesByProtocolType:(Protocol*) protocol {
    if (allClassesMemoization == nil || allClassesMemoization == NULL) {
        int numClasses = objc_getClassList(NULL, 0);
        allClassesMemoization = NULL;
        allClassesMemoization = malloc(sizeof(Class) * numClasses);
        allClassCount = objc_getClassList(allClassesMemoization, numClasses);
    }
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger i = 0; i < allClassCount; i++) {
        if (class_conformsToProtocol(allClassesMemoization[i],protocol))
            [result addObject:allClassesMemoization[i]];
    }
    return result;
}

// request caching

+ (Class) getRequestByProtocol:(Protocol*) protocol withType:(int) type {
    if (requestMemoization == nil)
        requestMemoization = [[NSMutableDictionary alloc] init];
    NSString* key = [ProtocolLocator getKeyForProtocol:protocol withType:type];
    return [requestMemoization objectForKey:key];
}

+ (void) saveClass:(Class)class forProtocol:(Protocol*) protocol withType:(int) type {
    if (requestMemoization == nil)
        requestMemoization = [[NSMutableDictionary alloc] init];
    if (class == nil)
        return;
    NSString* key = [ProtocolLocator getKeyForProtocol:protocol withType:type];
    [requestMemoization setObject:class forKey:key];
}

+ (NSString*) getKeyForProtocol:(Protocol*) protocol withType:(int) type {
    if (protocol == nil)
        return @"nil";
    NSString* protocolName = [[NSString alloc]initWithUTF8String:protocol_getName(protocol)];
    return [NSString stringWithFormat:@"%@_%d",protocolName,type];
}

@end
