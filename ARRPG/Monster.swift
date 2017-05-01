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
    
    let name = "Enemy"
    let monsterNode = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
    var HP = 20
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

    }
    
    func expire() {
        print("Monster has died!")
    }
    
    func consume() {
        print("Monster consumed an item")
    }
    
}
