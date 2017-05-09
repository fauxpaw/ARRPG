//
//  TestItem.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import UIKit

class BroadAxe: Equipable {
    
    //item increase max hp by 20 and max mp by 5
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 20)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 5)
    var effect3 = StatModifierFeature(stat: StatsType.ATK, amount: 3)
    var effect4 = StatModifierFeature(stat: StatsType.SAT, amount: 2)
    private let slots : [EquipmentSlots] = [.MainHand, .OffHand]
    
    //init should have an icon image, slots, owner, name, explaination, cost, effects
    init(owner: Character) {
        let name = "Broad Axe"
        let desc = "no desc here..."
        let cost = 500
        super.init(name: name, description: desc, cost: cost)
        self.effects = [effect1, effect2, effect3, effect4]
        self.owner = owner
        self.image = #imageLiteral(resourceName: "axe")
        self.possibleSlots = slots
        self.requiredSlots = [.MainHand]
        self.setDescriptioin()
        
    }
}
