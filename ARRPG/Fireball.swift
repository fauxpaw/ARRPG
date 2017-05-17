//
//  Fireball.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/16/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

struct Fireball: Spell, FireSpellDamage {
    
    var level: Int
    var types: [SpellDamageType]
    var elements: [DamageEffect]
    var dmg: Int
    
    func calculateDMG() {
        //pew pew
    }
}
