//
//  EquipmentManager.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation



//THIS CLASS CURRENTLY EXISTS FOR TESTING PURPOSES ONLY, FUNCTIONALITY IS ATTACHED TO CHARACTER CLASS

class EquipmentManager {
    
    var itemsEquipped = [Equipable]()
    
    func equip(item: Equipable) {
        
        self.isSlotOpen(item: item, possibleSlots: item.possibleSlots)
        
        var occupied = Set<EquipmentSlots>()
        for item in itemsEquipped {
            for slot in item.currentSlotsTaken {
                occupied.insert(slot)
            }
        }
        print("After an equip, current slots taken: \(occupied)")
        
    }
    
    func equipItemAtSlots(item: Equipable, slots: [EquipmentSlots]){
        print("Equiped a \(item.name) to \(slots)")
        self.itemsEquipped.append(item)
        item.currentSlotsTaken = slots
        item.onEquip()
    }
    
    func equipItemAtOpenSlot(item: Equipable, slot: EquipmentSlots) {
        //add item to gear list
        //set the slots taken
        //call equip on the item
        print("Equiped a \(item.name) to \(slot)")
        self.itemsEquipped.append(item)
        item.currentSlotsTaken.append(slot)
        item.onEquip()
    }
    
    fileprivate func dequip(item: Equipable, atIndex: Int) {
        item.onDequip()
        item.currentSlotsTaken.removeAll()
        self.itemsEquipped.remove(at: atIndex)
        
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
    
    func isSlotOpen(item: Equipable, possibleSlots: [EquipmentSlots]) {
        
        var occupied = Set<EquipmentSlots>()
        for item in itemsEquipped {
            for slot in item.currentSlotsTaken {
                occupied.insert(slot)
            }
        }
        
        for slot in possibleSlots {
            if !occupied.contains(slot) {
                
                equipItemAtOpenSlot(item: item, slot: slot)
                
                return
            } else {
                print("slot not open")
            }
        }
        
        for slot in item.requiredSlots {
            dequip(atSlot: slot)
        }
        
        equipItemAtSlots(item: item, slots: item.requiredSlots)
        
    }
}
