//
//  KnightsCuirass.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/8/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class KnightsCuirass: Equipable {
    
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 100)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 20)
    var effect3 = StatModifierFeature(stat: StatsType.DEF, amount: 25)
    
    init(owner: Character) {
        let name = "Knight's Cuirass"
        let desc = ""
        let cost = 5000
        super.init(name: name, description: desc, cost: cost)
        self.effects = [effect1, effect2, effect3]
        self.owner = owner
        self.image = #imageLiteral(resourceName: "armor")
        self.possibleSlots = [.Body]
        self.requiredSlots = [.Body]
        self.setDescriptioin()
    }
    
}
