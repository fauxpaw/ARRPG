//
//  CrusaderHelm.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/8/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class CrusaderHelm: Equipable {
    
    //item increase max hp by 20 and max mp by 5
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 50)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 30)
    var effect3 = StatModifierFeature(stat: StatsType.DEF, amount: 5)
    
    init(owner: Character) {
        let name = "Crusader Helm"
        let desc = ""
        let cost = 350
        super.init(name: name, description: desc, cost: cost)
        self.effects = [effect1, effect2, effect3]
        self.owner = owner
        self.image = #imageLiteral(resourceName: "helmet")
        self.possibleSlots = [.Head]
        self.requiredSlots = [.Head]
        self.setDescriptioin()
    }
    
}
