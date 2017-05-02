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
    
    var lvl = 1
    var maxHP: Int = 20
    var currentHP: Int = 20
    var maxMP: Int = 10
    var currentMP: Int = 10
    var attackDMG = 5
    var target : Character
    
    init(target: Character) {
        self.target = target
    }
    
    func attack() {
        print("Monster Attacks!")
        self.target.takeDmg(amount: self.attackDMG)
    }
    
    func takeDmg(amount: Int) {
        print("Monster got hit for \(amount)!")
        self.currentHP -= amount
    }
    
    func expire() {
        print("Monster has died!")
    }
    
    func consume() {
        print("Monster consumed an item")
    }
    
}
