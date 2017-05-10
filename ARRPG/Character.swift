//
//  Character.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Character:Entity, EntityBehavior, CharacterBehavior {
    
    var money = 0
    var owner : GameViewController?
    var bag = [Item]() //seperate manager?
    var itemsEquipped = [Equipable]() //seperate manager?
    

    //var inventory:
    //var gear:
    var target : Monster?
    
    init(hp: Int, mp: Int, owner: GameViewController? = nil) {
        
        self.owner = owner
        super.init()
        //set atk value
        self.atk.setLowerBound(value: 1)
        //set max hp
        self.maxHP.setValue(to: hp)
        //set current hp
        self.currentHP.setValue(to: hp)
        self.currentHP.setUpperBound(value: hp)
        //set max mp
        self.maxMP.setValue(to: mp)
        //set current mp
        self.currentMP.setValue(to: mp)
        self.currentMP.setUpperBound(value: mp)
        //set lvl
        self.lvl.setLowerBound(value: 1)
        self.lvl.setUpperBound(value: 99)
        
    }
    
    init(withLvl: Int) {
        super.init()
        self.lvl.setValue(to: withLvl)
        StatCalculator.shared.reCalcStats(entity: self)
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
    
    func addItemToBag(item: Item) {
        self.bag.append(item)
    }
    
    func removeItemFromBag(item: Item) {
        for (i,thing) in self.bag.enumerated() {
            if thing == item {
                self.bag.remove(at: i)
            }
        }
    }
    
    func equipItem(item: Equipable, possibleSlots: [EquipmentSlots]) -> [EquipmentSlots] {
        
        self.removeItemFromBag(item: item)
        
        var occupied = Set<EquipmentSlots>()
        
        for item in self.itemsEquipped {
            for slot in item.currentSlotsTaken {
                occupied.insert(slot)
            }
        }
        
        if item.requiredSlots.count > 1 {
            for slot in item.requiredSlots {
                dequip(atSlot: slot)
            }
            equipItemAtSlots(item: item, slots: item.requiredSlots)
            return item.requiredSlots
        }
        
        for slot in possibleSlots {
            if !occupied.contains(slot) {
                
                self.equipItemAtOpenSlot(item: item, slot: slot)
                return [slot]
            } else {
                print("slot not open")
            }
        }
        
        for slot in item.requiredSlots {
            dequip(atSlot: slot)
        }
        
        self.equipItemAtSlots(item: item, slots: item.requiredSlots)
        return item.requiredSlots
    }
    
    fileprivate func equipItemAtSlots(item: Equipable, slots: [EquipmentSlots]) {
        print("Equiped a \(item.name) to \(slots)")
        self.itemsEquipped.append(item)
        item.currentSlotsTaken = slots
        item.onEquip()
        
    }
    
    fileprivate func equipItemAtOpenSlot(item: Equipable, slot: EquipmentSlots) {
        print("Equiped a \(item.name) to \(slot)")
        self.itemsEquipped.append(item)
        item.currentSlotsTaken.append(slot)
        item.onEquip()
    }
    
    fileprivate func dequip(item: Equipable, atIndex: Int) {
        if let inventoryVC = owner as? InventoryViewController {
            print("owning VC is InventoryVC")
            inventoryVC.removeItemImage(fromSlot: item.currentSlotsTaken)
        }
        item.onDequip()
        item.currentSlotsTaken.removeAll()
        self.itemsEquipped.remove(at: atIndex)
        self.addItemToBag(item: item)
    }
    
    func dequip(atSlot: EquipmentSlots) {
        for (index, item) in self.itemsEquipped.enumerated() {
            for slot in item.currentSlotsTaken {
                if slot == atSlot {
                    print("removing an item at \(atSlot)")
                    self.dequip(item: item, atIndex: index)
                }
            }
        }
    }
    
    func consume(item: Consumable) {
        print("Item so tasty")
    }
    
    //Character Behavior Protocol
    
    func collectItem(itemToCollect: Item) {
        
        print("You have received a \(itemToCollect)")
    }
    
}
