//
//  KiteShield.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/8/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class KiteShield: Equipable {
    
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 50)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 15)
    var effect3 = StatModifierFeature(stat: StatsType.DEF, amount: 15)
    
    init(owner: Character) {
        let name = "Kite Shield"
        let desc = ""
        let cost = 5000
        super.init(name: name, description: desc, cost: cost)
        self.effects = [effect1, effect2, effect3]
        self.owner = owner
        self.image = #imageLiteral(resourceName: "shield")
        self.possibleSlots = [.OffHand]
        self.requiredSlots = [.OffHand]
        self.setDescriptioin()
    }

    
}
