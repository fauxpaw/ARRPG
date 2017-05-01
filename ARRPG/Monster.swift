//
//  Monster.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Monster: EntityBehavior, MonsterBehavior {
    
    func attack() {
        print("Monster attacks you!")
    }
    
    func takeDmg() {
        print("Monster got hit!")
    }
    
    func consume() {
        print("Monster consumed an item")
    }
    
}
