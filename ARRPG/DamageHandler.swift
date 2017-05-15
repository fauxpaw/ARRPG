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
    
    func calculateBaseDMG(attacker: Entity, defender: Entity) -> Int {
        // atk * atk / (atk + def)
        let attack = [attacker.ATK.getValue(), attacker.PAT.getValue(), attacker.CAT.getValue(), attacker.SAT.getValue(), attacker.MAT.getValue(), attacker.AAT.getValue(), attacker.FAT.getValue(), attacker.WAT.getValue(), attacker.EAT.getValue()]
        let defense = [defender.DEF.getValue(), defender.PDF.getValue(), defender.CDF.getValue(), defender.SDF.getValue(), defender.MDF.getValue(), defender.AR.getValue(), defender.FR.getValue(), defender.WR.getValue(), defender.ER.getValue()]
        print("attackArray: \(attack)")
        print("defenseArray: \(defense)")
        var dmg = 0
        
        for (index, num) in attack.enumerated() {
            if num > 0 || defense[index] > 0 {
                dmg += Int(attack[index] * attack[index] / (attack[index] + defense[index]))
            }
        }
        
        return dmg
    }
    
    func heal(caster: Entity, target: Entity) -> Int {
        //TODO checks for bonuses etc
    
        let value = caster.ATK.getValue() //<- change from atk value to some heal value
        return value
    }
}
