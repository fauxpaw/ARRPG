//
//  BagTests.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/10/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import XCTest
@testable import ARRPG
class BagTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddItem() {
        
        let player = Character(withLvl: 3)
        let item = Spatha(owner: player)
        player.addItemToBag(item: item)
        XCTAssertNotNil(player.bag.contents)
        XCTAssert(player.bag.contents.first == item)
    }
    
    func testRemoveItem() {
        let player = Character(withLvl: 3)
        let item = Spatha(owner: player)
        player.addItemToBag(item: item)
        if let first = player.bag.contents.first {
            player.removeItemFromBag(item: first)
            XCTAssert(player.bag.contents.count == 0)
        }
    }
    
    func testItemStack() {
        let player = Character(withLvl: 3)
        let item = HealthPotion(owner: player)
        let item2 = HealthPotion(owner: player)
        player.addItemToBag(item: item)
        player.addItemToBag(item: item2)
        XCTAssert(player.bag.contents.count == 1)
        XCTAssert(player.bag.stacked.count == 1)
        XCTAssert(player.bag.stacked[item.name] == 2)
    }
    
    func testRemoveStackable() {
        let player = Character(withLvl: 3)
        let item = HealthPotion(owner: player)
        let item2 = HealthPotion(owner: player)
        player.addItemToBag(item: item)
        player.addItemToBag(item: item2)
        let item3 = HealthPotion(owner: player)
        player.removeItemFromBag(item: item3)
        XCTAssert(player.bag.contents.count == 1)
        XCTAssert(player.bag.stacked.count == 1)
        XCTAssert(player.bag.stacked[item.name] == 1)
        player.removeItemFromBag(item: item3)
        XCTAssert(player.bag.stacked[item.name] == nil)
    }
    
    func testItemAddAfterCapacity() {
        let player = Character(withLvl: 3)
        player.bag.capacity = 2
        let item = HealthPotion(owner: player)
        let item2 = HealthPotion(owner: player)
        player.addItemToBag(item: item)
        player.addItemToBag(item: item2)
        let item3 = HealthPotion(owner: player)
        player.addItemToBag(item: item3)
        XCTAssertTrue(player.canAddItemToBag())
        let item4 = Spatha(owner: player)
        let item5 = KiteShield(owner: player)
        player.addItemToBag(item: item4)
        XCTAssertFalse(player.canAddItemToBag())
        player.addItemToBag(item: item5)
        XCTAssert(player.bag.contents.count == 2)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
