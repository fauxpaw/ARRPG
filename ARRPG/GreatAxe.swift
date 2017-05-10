//
//  BestItem.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import UIKit

class GreatAxe: Equipable {
    
    //item increase max hp by 20 and max mp by 5
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 50)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 25)
    var effect3 = StatModifierFeature(stat: StatsType.ATK, amount: 5)
    var effect4 = StatModifierFeature(stat: StatsType.SAT, amount: 4)
    
    init(owner: Character) {
        let name = "Great Axe"
        let desc = ""
        let cost = 950
        super.init(name: name, description: desc, cost: cost)
        self.effects = [effect1, effect2, effect3, effect4]
        self.owner = owner
        self.image = #imageLiteral(resourceName: "axeDouble2")
        self.possibleSlots = [.MainHand]
        self.requiredSlots = [.MainHand, .OffHand]
        self.setDescriptioin()

    }
}
