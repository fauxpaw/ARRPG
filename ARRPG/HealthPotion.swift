//
//  HealthPotion.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/8/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class HealthPotion: Consumable {
    
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
        if owner?.currentHP.getValue() == owner?.currentHP.getUpperBound() {
            return
        }
        super.consumeItem()
    }
}
