//
//  RVUtilsTests.m
//  RVUtilsTests
//
//  Created by Badchoice on 15/6/16.
//  Copyright © 2016 Revo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Collection.h"

@interface RVArrayCollectionTests : XCTestCase

@end

@implementation RVArrayCollectionTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

-(void)testSlice{
    NSArray * result        = [@[@1,@2,@3,@4,@5,@6] slice:3];
    NSArray * expectation   = @[@4,@5,@6];
    XCTAssertTrue([result isEqual:expectation]);
}

-(void)testSliceBigger{
    NSArray * result        = [@[@1,@2,@3,@4,@5,@6] slice:10];
    NSArray * expectation   = @[];
    XCTAssertTrue([result isEqual:expectation]);
}

-(void)testSliceEqual{
    NSArray * result        = [@[@1,@2,@3,@4,@5,@6] slice:6];
    NSArray * expectation   = @[];
    XCTAssertTrue([result isEqual:expectation]);
}

-(void)testTake{
    NSArray * result        = [@[@1,@2,@3,@4,@5,@6] take:2];
    NSArray * expectation   = @[@1,@2];
    XCTAssertTrue([result isEqual:expectation]);
}

-(void)testTakeBigger{
    NSArray * result        = [@[@1,@2,@3,@4,@5,@6] take:10];
    NSArray * expectation   = @[@1,@2,@3,@4,@5,@6];
    XCTAssertTrue([result isEqual:expectation]);
}

-(void)testTagkeNegative{
    NSArray * result        = [@[@1,@2,@3,@4,@5,@6] take:-2];
    NSArray * expectation   = @[@5,@6];
    XCTAssertTrue([result isEqual:expectation]);
}

-(void)testTakeNegativeBigger{
    NSArray * result        = [@[@1,@2,@3,@4,@5,@6] take:-10];
    NSArray * expectation   = @[@1,@2,@3,@4,@5,@6];
    XCTAssertTrue( [result isEqual:expectation] );
}

-(void)testSplice{
    NSArray* array2             = @[@1,@2,@3,@4,@5].mutableCopy;
    NSArray* chunk              = [array2 splice:2];
    NSArray* cunkExpectation    = @[@3,@4,@5];
    NSArray* arrayExpectation   = @[@1,@2];
    XCTAssertTrue([chunk isEqual:cunkExpectation]);
    XCTAssertTrue([array2 isEqual:arrayExpectation]);
}

-(void)testSpliceBigger{
    NSArray* array2             = @[@1,@2,@3,@4,@5].mutableCopy;
    NSArray* chunk              = [array2 splice:10];
    NSArray* cunkExpectation    = @[];
    NSArray* arrayExpectation   = @[@1,@2,@3,@4,@5];
    XCTAssertTrue([chunk isEqual:cunkExpectation]);
    XCTAssertTrue([array2 isEqual:arrayExpectation]);
}

-(void)testExpand{
    NSDictionary* d1    = @{@"groups" : @[@1,@2]};
    NSDictionary* d2    = @{@"groups" : @[@2,@3,@3]};
    NSArray * array     = @[d1,d2];
    
    NSDictionary* result = [array expand:@"groups"];
    
    NSDictionary* expectation = @{
                                  @1 : @[d1],
                                  @2 : @[d1,d2],
                                  @3 : @[d2,d2]
                                  }.mutableCopy;
    
    XCTAssertTrue([result isEqual: expectation]);
}

-(void)testExpandUnique{
    NSDictionary* d1    = @{@"groups" : @[@1,@2]};
    NSDictionary* d2    = @{@"groups" : @[@2,@3,@3]};
    NSArray * array     = @[d1,d2];
    
    NSDictionary* result = [array expand:@"groups" unique:YES];
    
    NSDictionary* expectation = @{
                                  @1 : @[d1],
                                  @2 : @[d1,d2],
                                  @3 : @[d2]
                                  }.mutableCopy;
    
    XCTAssertTrue([result isEqual: expectation]);
}

@end