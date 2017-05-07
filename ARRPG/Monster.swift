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
    
    init(hp: Int, mp: Int, target: Character) {
        self.target = target
        super.init()
        self.maxHP.setValue(to: hp)
        self.currentHP.setValue(to: hp)
        self.maxMP.setValue(to: mp)
        self.currentMP.setValue(to: mp)
        
        
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
    
    func consume() {
        print("Monster consumed an item")
    }
    
}
