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

    //let defaultSlot : String
    //let secondarySlot : String?
    
    //let isEquiped : Bool
    
    func onDequip() {
        for effect in effects {
            if let owner = owner {
                effect.deactivate(target: owner)
            } else {
                print("no owner for item deActivation")
            }
        }
    }

    func onEquip() {
        for effect in effects {
            if let owner = owner {
                effect.activate(target: owner)
            } else {
                print("no owner for item activation")
            }
        }
    }

    
    
    
}
