//
//  BestItem.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import UIKit

class BestItem: Equipable {
    
    //item increase max hp by 20 and max mp by 5
    var effect1 = StatModifierFeature(stat: StatsType.MHP, amount: 50)
    var effect2 = StatModifierFeature(stat: StatsType.MMP, amount: 25)
    
    init(owner: Character) {
        let name = "Great Axe"
        let desc = "+50HP +25MP"
        let cost = 10000
        super.init(name: name, description: desc, cost: cost)
        self.effects.append(effect1)
        self.effects.append(effect2)
        self.owner = owner
        self.image = #imageLiteral(resourceName: "axeDouble2")
        self.requiredSlots = [.Primary, .Secondary]
    }
}
