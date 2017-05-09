//
//  Character.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

protocol EntityBehavior {
        
    func attack(target: Entity)
    func attack(targets: [Entity])
    func takeDmg(amount: Int) -> Int
    func expire()
    func consume(item: Consumable)
    
}
