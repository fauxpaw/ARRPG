//
//  Attack.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Attack: Stat {
    
    init(val: Int) {
        super.init(statName: "ATK", val: val)
        self.setLowerBound(value: 1)
    }
    
}
