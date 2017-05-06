//
//  StateModifierFeature.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class StatModifierFeature: Feature {
    
    var stat: StatTypes
    var amount: Int = 0
    
    init(stat: StatTypes, amount: Int) {
        self.stat = stat
        self.amount = amount
    }
    
    override func onApply() {
        
    }
    
    override func onRemove() {
        
    }
    
}
