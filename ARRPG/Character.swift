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
    var gear = [Item]()
    var exp: Int = 0

    //var weapon: WeaponBehavior?
    //var inventory:
    //var gear:
    var target : Monster?
    
    init(hp: Int, mp: Int, owner: GameViewController? = nil) {
        
        self.owner = owner
        super.init()
        self.atk.setValue(to: 6)
        self.atk.setLowerBound(value: 1)
        self.maxHP.setValue(to: hp)
        self.currentHP.setValue(to: hp)
        self.currentHP.setUpperBound(value: hp)
        self.maxMP.setValue(to: mp)
        self.currentMP.setValue(to: mp)
        self.currentMP.setUpperBound(value: mp)
        self.lvl.setLowerBound(value: 1)
        self.lvl.setUpperBound(value: 99)
        
    }
    
    func attack(target: Entity) {
        
        print("You swing for mighty dmg")
        
    }
    
    func attack(targets: [Entity]) {
        print("mad aoe bro")
        
    }
    
    func takeDmg(amount: Int) -> Int{
        print("Ow, you took \(amount) dmg")

        self.currentHP.modifyBy(val: -amount)
        
        return self.currentHP.getValue()
    }
    
    func expire() {
        //run any animations...
        print("You have died...game over")
    }
    
    func equipItem(item: StatModifierFeature) {
        
        item.activate(target: self)
        
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
