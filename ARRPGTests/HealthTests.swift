//
//  HealthTests.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/11/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import XCTest
@testable import ARRPG

class HealthTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHealthGrowth() {
        let player = Character(withLvl: 3)
        XCTAssertTrue(player.currentHP.getValue() == 30)
    }
    
    func testMaxHealthIncrease() {
        let player = Character(withLvl: 3)
        let item = Spatha(owner: player)
        let _ = player.equipItem(item: item, possibleSlots: item.possibleSlots)
        XCTAssertTrue(player.maxHP.getValue() == 80)
        print("current hp is \(player.currentHP.getValue())")
        player.dequip(atSlot: .MainHand)
        XCTAssertTrue(player.maxHP.getValue() == 30)
    }
    
    func testOverHealing() {
        let player = Character(withLvl: 3)
        XCTAssertTrue(player.maxHP.getValue() == 30)
        let potion1 = HealthPotion(owner: player)
        let potion2 = HealthPotion(owner: player)
        player.consume(item: potion1)
        XCTAssertTrue(player.currentHP.getValue() == 30)
        let item = Spatha(owner: player)
        let _ = player.equipItem(item: item, possibleSlots: item.possibleSlots)
        XCTAssertTrue(player.maxHP.getValue() == 80)
        XCTAssertTrue(player.currentHP.getValue() == 80)
        player.consume(item: potion1)
        player.consume(item: potion2)
        XCTAssertTrue(player.maxHP.getValue() == 80)
        XCTAssertTrue(player.currentHP.getValue() == 80)

    }
    
    func testMaxHealthDecrease() {
        let player = Character(withLvl: 3)
        let swordy = Spatha(owner: player)
        let sheild = KiteShield(owner: player)
        let _ = player.equipItem(item: swordy, possibleSlots: swordy.possibleSlots)
        let _ = player.equipItem(item: sheild, possibleSlots: sheild.possibleSlots)
        XCTAssertTrue(player.maxHP.getValue() == 130)
        XCTAssertTrue(player.currentHP.getValue() == 130)
        player.dequip(atSlot: .OffHand)
        XCTAssertTrue(player.maxHP.getValue() == 80)
        XCTAssertTrue(player.currentHP.getValue() == 80)
        player.dequip(atSlot: .MainHand)
        XCTAssertTrue(player.maxHP.getValue() == 30)
        XCTAssertTrue(player.currentHP.getValue() == 30)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
