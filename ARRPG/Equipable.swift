//
//  Weapon.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Equipable: Item, EquipableItemBehavior {
    
    var effects = [StatModifierFeature]()
    //possible slots
    
    var possibleSlots: [EquipmentSlots] = [.None]
    var requiredSlots : [EquipmentSlots] = [.None]
    //current slot taken
    var currentSlotsTaken = [EquipmentSlots]()
    var isEquiped = false
    
    func onEquip() {
        
        for effect in effects {
            if let owner = owner {
                effect.activate(target: owner)
            } else {
                print("no owner for item activation")
                return
            }
        }
        isEquiped = true
    }
    
    func onDequip() {
        
        if !isEquiped {return}
        
        for effect in effects {
            if let owner = owner {
                effect.deactivate(target: owner)
            
            } else {
                print("no owner for item deActivation")
                return
            }
        }
        isEquiped = false
        if currentSlotsTaken.count > 0 {
           currentSlotsTaken.removeAll()
        }
    }
    
    func setDescriptioin() {
        var describe = ""
        for effect in effects {
           describe += "\(effect.getInfo()) "
        }
        self.desc = describe
    }

}


