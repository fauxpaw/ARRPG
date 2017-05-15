//
//  HitRateCalculatorTests.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/14/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import XCTest
@testable import ARRPG

class HitRateCalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //To pass tests, chance to hit should be > 0.95
    
    func testHitChanceAt1() {
        //@1 need ~5 acc over mob for 95% hit
        let player = Character(withLvl: 1)
        let mob = Monster(withLvl: 1, target: player)
        player.ACC.modifyBy(val: 5)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChanceAt10() {
        //@10 need ~45 acc over mob for 95% hit
        let player = Character(withLvl: 10)
        player.ACC.modifyBy(val: 47)
        let mob = Monster(withLvl: 10, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChanceAt20() {
        //@20 need ~80 acc over mob for 95% hit chance
        let player = Character(withLvl: 20)
        player.ACC.modifyBy(val: 81)
        let mob = Monster(withLvl: 20, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChanceAt75() {
        //@75 need 170 acc over mob for 95% hit chance
        let player = Character(withLvl: 75)
        player.ACC.modifyBy(val: 170)
        let mob = Monster(withLvl: 75, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChanceAt99() {
        //@99 need ~190 acc over mob for 95% hit chance
        let player = Character(withLvl: 99)
        player.ACC.modifyBy(val: 190)
        let mob = Monster(withLvl: 99, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    //Unequal level tests
    
    //player favored
    func testHitChancePlayerUpTenLevelsEarlyGame() {
        //@player early game +10 levels - auto-hit
        let player = Character(withLvl: 10)
        let mob = Monster(withLvl: 1, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChancePlayerUpTenLevelsMidGame() {
        //@player mid game +10 levels - need ~105 acc over mob
        let player = Character(withLvl: 55)
        player.ACC.modifyBy(val: 105)
        let mob = Monster(withLvl: 45, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChancePlayerUpTenLevelsEndGame() {
        //@player end game +10 levels - need ~150 acc over mob
        let player = Character(withLvl: 99)
        player.ACC.modifyBy(val: 152)
        let mob = Monster(withLvl: 89, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    //mob favored
    
    func testHitChancePlayerDownTenLevelsEarlyGame() {
        //@player early game -10 levels - need ~75 acc over mob
        let player = Character(withLvl: 1)
        player.ACC.modifyBy(val: 75)
        let mob = Monster(withLvl: 10, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChancePlayerDownTenLevelsMidGame() {
        //@player mid game -10 levels - need ~180 acc over mob
        let player = Character(withLvl: 45)
        player.ACC.modifyBy(val: 180)
        let mob = Monster(withLvl: 55, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testHitChancePlayerDownTenLevelsEndGame() {
        //@player mid game -10 levels - need ~220 acc over mob
        let player = Character(withLvl: 89)
        player.ACC.modifyBy(val: 220)
        let mob = Monster(withLvl: 99, target: player)
        let answer = HitRateCalculator.shared.hitCheck(attacker: player, defender: mob)
        print(answer)
        XCTAssert(answer >= 0.95)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
