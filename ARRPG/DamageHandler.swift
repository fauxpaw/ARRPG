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
    
    //Physical DMGs
    func calculateBaseDMG(attacker: Entity, defender: Entity) -> Int {
        // atk * atk / (atk + def)
        let dmg = attacker.atk.getValue() * attacker.atk.getValue() / (attacker.atk.getValue() + defender.def.getValue())
        return dmg
    }
    
    func calculatePiercingDMG(attacker: Entity, defender: Entity) -> Int {
        // atk * atk / (atk + def)
        let dmg = attacker.atk.getValue() * attacker.atk.getValue() / (attacker.atk.getValue() + defender.def.getValue())
        return dmg
    }
    
    //Magical DMGs
    func calculateDMG(attacker: Entity, defender: [Entity]) {
        
    }
    
    func heal(caster: Entity, target: Entity) -> Int {
        //TODO checks for bonuses etc
    
        let value = caster.atk.getValue() //<- change from atk value to some heal value
        return value
    }
}
