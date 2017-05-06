//
//  Character.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

protocol EntityBehavior {
    
    var currentHP : Int { get set}
    var maxHP: Int { get set}
    var currentMP : Int { get set}
    var maxMP : Int { get set}
    
    func attack(target: Entity)
    func attack(targets: [Entity])
    func takeDmg(amount: Int) -> Int
    func expire()
    func consume()
    
}
