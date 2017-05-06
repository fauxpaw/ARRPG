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
    
    init(hp: Int, mp: Int, target: Character) {
        self.target = target
        super.init()
        self.maxHP = hp
        self.currentHP = hp
        self.maxMP = mp
        self.currentMP = mp
        
        
    }
    
    func attack(target: Entity) {
        print("Monster Attacks!")
    }
    
    func attack(targets: [Entity]) {
        print("mad aoes")
    }
    
    func takeDmg(amount: Int) -> Int {
        print("Monster got hit for \(amount)!")
        self.currentHP = max(self.currentHP - amount, 0)
    
        return self.currentHP
    }
    
    func expire() {
        print("Monster has died!")
    }
    
    func consume() {
        print("Monster consumed an item")
    }
    
}
