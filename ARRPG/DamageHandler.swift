//
//  DamageHandler.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class DamageHandler {
    
    //base atk
    //elemental dmg
    //base def
    //elemental res
    static let shared = DamageHandler()
    
    private init() {}
    
    func calculateDMG(attacker: Entity, defender: Entity) {
        // atk * atk / (atk + def)
        let dmg = attacker.atk * attacker.atk / (attacker.atk + defender.def)
        
    }
    
    func calculateDMG(attacker: Entity, defender: [Entity]) {
        
    }
    
    
    
    
}
