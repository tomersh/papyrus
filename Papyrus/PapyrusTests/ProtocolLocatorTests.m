//
//  PapyrusTests.m
//  PapyrusTests
//
//  Created by Tomer shiri on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

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
//    for (Class clazzInArray in array) {
//        if (clazzInArray == clazz)
//            return;
//    }
    STAssertTrue([array containsObject:clazz],@"array does not contains the class %@ when it should.",NSStringFromClass(clazz));
//    STFail(@"array does not contains the class %@ when it should.",NSStringFromClass(clazz));
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
