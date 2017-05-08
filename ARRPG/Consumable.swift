//
//  Consumable.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/8/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Consumable: Item, ConsumableItemBehavior {
    
    var duration: TimeInterval? = nil
    var effects = [StatModifierFeature]()
    
    func consumeItem() {
        for effect in effects {
            if let owner = owner {
                effect.activate(target: owner)
                
            } else {
                print("no owner for item activation")
                return
            }
        }
    }
}
