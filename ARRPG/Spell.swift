//
//  Spell.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/16/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

protocol Spell {
    
    var level: Int {get set}
    var types: [SpellDamageType] {get set}
    var elements: [DamageEffect] {get set}
    //var effects: []
    
    func calculateDMG()
}
