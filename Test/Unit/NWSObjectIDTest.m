//
//  NWSObjectIDTest.m
//  Spaghetti
//
//  Copyright (c) 2012 noodlewerk. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NWSArrayObjectID.h"
#import "NWSManagedObjectID.h"
#import "NWSMemoryObjectID.h"
#import "NWAbout.h"


@interface NWSTestManagedObjectID : NSManagedObjectID
@end
@implementation NWSTestManagedObjectID
- (BOOL)isEqual:(NWSTestManagedObjectID *)object
{
    return self == object;
}
- (NSString *)description
{
    return nil;
}
- (NSEntityDescription *)entity
{
    return nil;
}
@end



@interface NWSObjectIDTest : SenTestCase
@end

@implementation NWSObjectIDTest

- (void)setUp
{
    NWSLBreakWarn();
}

- (void)testArrayObjectID
{
    NSArray *identifiers = @[[[NWSObjectID alloc] init], [[NWSObjectID alloc] init]];
    NWSArrayObjectID *i = [[NWSArrayObjectID alloc] initWithIdentifiers:identifiers];
    NWSArrayObjectID *j = [[NWSArrayObjectID alloc] initWithIdentifiers:identifiers];
    NWSArrayObjectID *k = [[NWSArrayObjectID alloc] initWithIdentifiers:@[i]];
    
    STAssertTrue([i isEqual: j], @"");
    STAssertTrue(![i isEqual: k], @"");
    STAssertNotNil(i.description, @"");
    STAssertNotNil(i.about, @"");
}

- (void)testManagedObjectID
{
    NWSTestManagedObjectID *test1 = [[NWSTestManagedObjectID alloc] init];
    NWSTestManagedObjectID *test2 = [[NWSTestManagedObjectID alloc] init];
    NWSManagedObjectID *i = [[NWSManagedObjectID alloc] initWithID:test1];
    NWSManagedObjectID *j = [[NWSManagedObjectID alloc] initWithID:test1];
    NWSManagedObjectID *k = [[NWSManagedObjectID alloc] initWithID:test2];
    
    STAssertTrue([i isEqual: j], @"");
    STAssertTrue(![i isEqual: k], @"");
    STAssertNotNil(i.description, @"");
    STAssertNotNil(i.about, @"");
}

- (void)testMemoryObjectID
{
    NSString *object1 = @"1";
    NSString *object2 = @"2";
    NWSMemoryObjectID *i = [[NWSMemoryObjectID alloc] initWithObject:object1];
    NWSMemoryObjectID *j = [[NWSMemoryObjectID alloc] initWithObject:object1];
    NWSMemoryObjectID *k = [[NWSMemoryObjectID alloc] initWithObject:object2];
    
    STAssertTrue([i isEqual: j], @"");
    STAssertTrue(![i isEqual: k], @"");
    STAssertNotNil(i.description, @"");
    STAssertNotNil(i.about, @"");
}

@end
