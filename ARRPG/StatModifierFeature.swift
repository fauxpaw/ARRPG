//
//  StateModifierFeature.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class StatModifierFeature: Feature {
    
    //var stat: StatTypes
    var statToMod: StatsType
    var amount: Int = 0
    
    init(stat: StatsType, amount: Int) {
        self.statToMod = stat
        self.amount = amount
    }
    
    override func onApply() {
        if statToMod == StatsType.ATK {
            target?.atk.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.DEF {
            target?.def.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.EXP {
            //TODO
        }
        
        if statToMod == StatsType.MHP {
            target?.maxHP.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.HP {
            target?.currentHP.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.MMP {
            target?.maxMP.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.MP {
            target?.currentMP.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.LVL {
            target?.lvl.modifyBy(val: self.amount)
        }
    }
    
    override func onRemove() {
        if statToMod == StatsType.ATK {
            target?.atk.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.DEF {
            target?.def.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.EXP {
            //TODO
        }
        
        if statToMod == StatsType.MHP {
            target?.maxHP.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.HP {
            target?.currentHP.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.MMP {
            target?.maxMP.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.MP {
            target?.currentMP.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.LVL {
            target?.lvl.modifyBy(val: -self.amount)
        }
    }
    
}



