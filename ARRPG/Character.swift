//
//  Character.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Character:Entity, EntityBehavior, CharacterBehavior {
    
    var owner : GameViewController?
    var bag = [Item]()
    var exp: Int = 0

    //var weapon: WeaponBehavior?
    //var inventory:
    //var gear:
    var target : Monster?
    
    init(hp: Int, mp: Int, owner: GameViewController? = nil) {
        
        self.owner = owner
        super.init()
        self.maxHP = hp
        self.currentHP = hp
        self.maxMP = mp
        self.currentMP = mp
        self.atk = 5
        
    }
    
    func attack(target: Entity) {
        
        print("You swing for mighty dmg")
        
    }
    
    func attack(targets: [Entity]) {
        print("mad aoe bro")
        
    }
    
    func takeDmg(amount: Int) -> Int{
        print("Ow, you took \(amount) dmg")

        self.currentHP = max(self.currentHP - amount, 0)
        
        return self.currentHP
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
    
    func collectItem(itemToCollect: Item) {
        
        bag.append(itemToCollect)
        
        print("You have received a \(itemToCollect)")
    }
    
}
