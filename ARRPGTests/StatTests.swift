//
//  StatTests.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import XCTest

@testable import ARRPG
class StatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMaxValueSet() {
        let stat = Stat(statName: "DEX", val: 5)
        stat.setUpperBound(value: 20)
        XCTAssertTrue(stat.getUpperBound() == 20)
    }
    
    func testMaxValueMod() {
        let stat = Stat(statName: "DEX", val: 5)
        stat.setUpperBound(value: 20)
        stat.modifyUpperBound(value: 5)
        XCTAssertTrue(stat.getUpperBound() == 25)
    }
    
    func testMinValueSet() {
        let stat = Stat(statName: "DEX", val: 5)
        stat.setLowerBound(value: 20)
        XCTAssertTrue(stat.getLowerBound() == 20)
    }
    
    func testMinValueMod() {
        let stat = Stat(statName: "DEX", val: 5)
        stat.setLowerBound(value: 20)
        stat.modifyLowerBound(value: 6)
        XCTAssertTrue(stat.getLowerBound() == 26)
        stat.modifyLowerBound(value: -16)
        XCTAssertTrue(stat.getLowerBound() == 10)
    }
    
    func testValueCap() {
        let STR = Stat(statName: "STR", val: 5)
        STR.setUpperBound(value: 10)
        STR.modifyBy(val: 15)
        XCTAssertTrue(STR.getValue() == 10)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
