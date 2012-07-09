//
//  InterfaceLocator.h
//  Newsfeed
//
//  Created by Tomer Shiri on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProtocolLocator : NSObject

+ (Class) getClassByProtocolType:(Protocol*) protocol withType:(int) type;
+ (NSArray*) getAllClassesByProtocolType:(Protocol*) protocol;

@end
