//
//  EquipmentManagerTests.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import XCTest
@testable import ARRPG

class EquipmentManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testEquip() {
        let player = Character(hp: 100, mp: 10)
        let manager = EquipmentManager()
        let onehandedAxe_1 = BroadAxe(owner: player)
        let onehandedSword_1 = Spatha(owner: player)
        let twohandedAxe_1 = GreatAxe(owner: player)
        let spatha = Spatha(owner: player)
        let spatha2 = Spatha(owner: player)
        
        manager.equip(item: onehandedAxe_1)
        manager.equip(item: onehandedSword_1)
        manager.equip(item: spatha)
        manager.equip(item: twohandedAxe_1)
        manager.equip(item: spatha2)
        XCTAssertEqual(150, player.maxHP.getValue())
        XCTAssertNotNil(manager.itemsEquipped)
        XCTAssert(manager.itemsEquipped.count == 1)
        manager.equip(item: spatha)
        XCTAssertEqual(200, player.maxHP.getValue())
        XCTAssert(manager.itemsEquipped.count == 2)
        manager.dequip(atSlot: EquipmentSlots.OffHand)
        XCTAssertEqual(150, player.maxHP.getValue())
        manager.equip(item: twohandedAxe_1)
        XCTAssert(manager.itemsEquipped.count == 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
