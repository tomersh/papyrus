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


#import "ProtocolLocator.h"
#import "objc/runtime.h"

@implementation ProtocolLocator

static Class* allClassesMemoization = NULL; 
static int allClassCount;

+(void)initialize {
    int numClasses = objc_getClassList(NULL, 0);
    allClassesMemoization = NULL;
    allClassesMemoization = malloc(sizeof(Class) * numClasses);
    allClassCount = objc_getClassList(allClassesMemoization, numClasses);
}

+(NSArray *) getAllClassesByProtocolType:(Protocol*) protocol {
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger i = 0; i < allClassCount; i++) {
        if (class_conformsToProtocol(allClassesMemoization[i],protocol))
            [result addObject:allClassesMemoization[i]];
    }
    return [[[NSArray alloc] initWithArray:result] autorelease];
}

@end
