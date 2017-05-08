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
        let onehandedAxe_1 = TestItem(owner: player)
        let onehandedAxe_2 = TestItem(owner: player)
        let twohandedAxe_1 = BestItem(owner: player)
        
        manager.equip(item: onehandedAxe_1)
        manager.equip(item: onehandedAxe_2)
        manager.equip(item: twohandedAxe_1)
        for item in manager.itemsEquipped {
            print(item.name)
            print("required slots: \(item.requiredSlots)")
            print("current slots: \(item.currentSlotsTaken)")
        }

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
