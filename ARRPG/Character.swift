//
//  Character.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Character:Entity, EntityBehavior, CharacterBehavior {
    
    var bag = [String]()
    var exp: Int = 0
    var maxHP: Int
    var currentHP: Int {
        didSet {
            if currentHP <= 0 {
                print("HP is in death bounds")
            }
        }
    }
    
    var maxMP: Int
    var currentMP: Int
    var attackDMG = 5
    
    //var weapon: WeaponBehavior?
    //var inventory:
    //var gear:
    var target : Monster?
    
    init(hp: Int, mp: Int) {
        self.maxHP = hp
        self.currentHP = hp
        self.maxMP = mp
        self.currentMP = mp
        
    }
    
    func attack() {
        if self.target != nil {
            print("You swing for mighty dmg")
            self.target?.takeDmg(amount: self.attackDMG)
        }
        else {
            print("player has no target to attack")
        }
    }
    
    func takeDmg(amount: Int) {
        print("Ow, you took \(amount) dmg")
        self.currentHP -= amount
    }
    
    func expire() {
        //run any animations...
        print("You have died...game over")
    }
    
    func equipItem() {
        
    }
    
    func dequipItem() {
        
    }
    
    func consume() {
        
    }
    
    //Character Behavior Protocol
    
    func collectItem(itemToCollect: String) {
        
        bag.append(itemToCollect)
        print("You have received a \(itemToCollect)")
    }
    
}
