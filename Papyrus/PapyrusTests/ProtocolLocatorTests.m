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

#import "ProtocolLocatorTests.h"

@protocol testProtocol <NSObject>

@end

@protocol unUsedtestProtocol <NSObject>

@end

@interface testClass : NSObject<testProtocol>
@end

@implementation testClass
@end

@interface anotherTestClass : NSObject<testProtocol>
@end

@implementation anotherTestClass
@end

@implementation ProtocolLocatorTests


-(void) assertClass:(Class) clazz isInArray:(NSArray*) array {
    STAssertTrue([array containsObject:clazz],@"array does not contains the class %@ when it should.",NSStringFromClass(clazz));
}

- (void)testGetAllClassesByProtocolType_protocolIsNull_returnsEmptyArray
{
    NSArray* result = [ProtocolLocator getAllClassesByProtocolType:nil];
    STAssertTrue([result isKindOfClass:[NSArray class]], @"should return empty array when protocol is nil");
    STAssertEquals([result count], 0U, @"should return empty array when protocol is nil");
}

- (void)testGetAllClassesByProtocolType_protocolIsPassed_returnsClassesThatImplementsProtocol
{
    NSArray* result = [ProtocolLocator getAllClassesByProtocolType:@protocol(testProtocol)];
    STAssertEquals([result count], 2U, @"should return empty array when protocol is nil");
    [self assertClass:[testClass class] isInArray:result];
    [self assertClass:[anotherTestClass class] isInArray:result];
}

- (void)testGetAllClassesByProtocolType_protocolHasNoImplementation_returnsEmptyArray
{
    NSArray* result = [ProtocolLocator getAllClassesByProtocolType:@protocol(unUsedtestProtocol)];
    STAssertTrue([result isKindOfClass:[NSArray class]], @"should return empty array when protocol is unused");
    STAssertEquals([result count], 0U, @"should return empty array when protocol is unused");
}



@end
