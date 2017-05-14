//
//  Monster.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import SceneKit

class Monster: Entity, EntityBehavior, MonsterBehavior {
    
    var target : Character
    var items = [Item]()
    
    init(withLvl: Int, target: Character) {
        self.target = target
        super.init()
        self.lvl.setValue(to: withLvl)
        StatCalculator.shared.reCalcBaseStats(entity: self)
        StatCalculator.shared.applyItemBonues(entity: self)
        
    }
    
    func attack(target: Entity) {
        print("Monster Attacks!")
    }
    
    func attack(targets: [Entity]) {
        print("mad aoes")
    }
    
    func takeDmg(amount: Int) -> Int {
        print("Monster got hit for \(amount)!")
        self.currentHP.modifyBy(val: -1 * amount)
    
        return self.currentHP.getValue()
    }
    
    func expire() {
        print("Monster has died!")
    }
    
    func consume(item: Consumable) {
        print("Item so tasty")
    }
    
}
