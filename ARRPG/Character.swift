//
//  Character.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Character: EntityBehavior, CharacterBehavior {
    
    var maxHP: Int
    var currentHP: Int
    var maxMP: Int
    var currentMP: Int
    var weapon: WeaponBehavior?
    //var inventory:
    //var gear:
    
    init(hp: Int, mp: Int) {
        self.maxHP = hp
        self.currentHP = hp
        self.maxMP = mp
        self.currentMP = mp
    }
    
    func attack() {
        print("Swings for crazy dmg")
    }
    
    func takeDmg() {
        print("Ow, took dmg")
    }
    
    func equipItem() {
        
    }
    
    func dequipItem() {
        
    }
    
    func consume() {
        
    }
    
}
