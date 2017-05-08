//
//  EquipmentManager.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class EquipmentManager {
    
    var itemsEquipped = [Equipable]()
    
    func equip(item: Equipable) {
        
        //check for dual wield
        
        
        //case of slot open
        if areSlotsOpen(requiredSlots: item.requiredSlots) {
            self.equipItemAtOpenSlot(item: item, slots: item.requiredSlots)
            return
        }
        
        //case of taken slot
        for slot in item.requiredSlots {
            self.dequip(atSlot: slot)
        }
        //case of slot taken
        //unequip on slots needed
        //add item to array
        //item.slots = slots
        //item.equip
        
    }
    
    func equipItemAtOpenSlot(item: Equipable, slots: [EquipmentSlots]) {
        //add item to gear list
        //set the slots taken
        //call equip on the item
        self.itemsEquipped.append(item)
        item.currentSlotsTaken = slots
        item.onEquip()
    }
    
    func dequip(item: Equipable, atIndex: Int) {
        item.onDequip()
        item.currentSlotsTaken.removeAll()
        
    }
    
    func dequip(atSlot: EquipmentSlots) {
        for (index, item) in self.itemsEquipped.enumerated() {
            for slot in item.currentSlotsTaken {
                if slot == atSlot {
                    self.dequip(item: item, atIndex: index)
                }
            }
        }
        //for items in array, find items that match argument
        //if item.slot == slots &&
        //items.dequip
        
    }
    
    func areSlotsOpen(requiredSlots: [EquipmentSlots]) -> Bool {
        for reqSlot in requiredSlots {
            for item in self.itemsEquipped {
                for slot in item.currentSlotsTaken {
                    if reqSlot == slot {
                        return false
                    }
                }
            }
        }
        return true
    }
}
