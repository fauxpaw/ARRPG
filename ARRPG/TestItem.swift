//
//  TestItem.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import UIKit

class TestItem: Equipable {
    
    //item increase max hp by 20 and max mp by 5
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 20)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 5)
    private let slots : [EquipmentSlots] = [.Primary, .Secondary]
    
    //init should have an icon image, slots, owner, name, explaination, cost, effects
    init(owner: Character) {
        let name = "Broad Axe"
        let desc = "+20HP +5MP"
        let cost = 500
        super.init(name: name, description: desc, cost: cost)
        self.effects.append(effect1)
        self.effects.append(effect2)
        self.owner = owner
        self.image = #imageLiteral(resourceName: "axe")
        self.possibleSlots = slots
        self.requiredSlots = [.Primary]
        
    }
}
