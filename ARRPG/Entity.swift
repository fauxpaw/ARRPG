//
//  Entity.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Entity {
    
    var magAtk = 1
    var lvl = Level(val: 1)
    var atk = Attack(val: 1)
    var def = Stat(val: 0)
    var maxHP = Stat(val: 1)
    var currentHP = Stat(val: 1)
    var maxMP = Stat(val: 1)
    var currentMP =  Stat(val: 1)
    var stats = [Stat]()
    //var weapon = unarmed
}

