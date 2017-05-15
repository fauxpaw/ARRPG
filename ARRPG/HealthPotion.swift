//
//  HealthPotion.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/8/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class HealthPotion: Consumable, StackableItem {
    
    var isStackable: Bool = true
    let effect1 = StatModifierFeature(stat:StatsType.HP , amount: 50)
    
    init(owner: Character) {
        let name = "Health Potion"
        let description = "+50 HP"
        let cost = 100
        super.init(name: name, description: description, cost: cost)
        self.image = #imageLiteral(resourceName: "potionRed")
        self.effects.append(effect1)
        self.owner = owner
    }
    
    override func consumeItem() {
        guard let owner = owner else {return}
        if let upper = owner.currentHP.getUpperBound() {
            if owner.currentHP.getValue() >= upper {
                print("Potion will have no effect")
                return
            }
        }
        
        super.consumeItem()
    }
}
