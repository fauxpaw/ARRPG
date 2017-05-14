//
//  Katana.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Spatha: Equipable {
    
    //item increase max hp by 20 and max mp by 5
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 50)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 5)
    var effect3 = StatModifierFeature(stat: StatsType.ATK, amount: 1)
    var effect4 = StatModifierFeature(stat: StatsType.SAT, amount: 3)

    init(owner: Character) {
        let name = "Spatha"
        let desc = ""
        let cost = 500
        super.init(name: name, description: desc, cost: cost)
        self.effects = [effect1, effect2, effect3, effect4]
        self.owner = owner
        self.image = #imageLiteral(resourceName: "sword")
        self.possibleSlots = [.MainHand, .OffHand]
        self.requiredSlots = [.MainHand]
        self.setDescriptioin()
    }
    
}
