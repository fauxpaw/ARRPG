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
            target?.maxValueDidChange(statType: .MHP, amount: self.amount)
        }
        
        if statToMod == StatsType.HP {
            target?.currentHP.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.MMP {
            target?.maxMP.modifyBy(val: self.amount)
            target?.maxValueDidChange(statType: .MMP, amount: self.amount)
        }
        
        if statToMod == StatsType.MP {
            target?.currentMP.modifyBy(val: self.amount)
        }
        
        if statToMod == StatsType.LVL {
            target?.lvl.modifyBy(val: self.amount)
        }
    }
    
    override func onRemove() {
        //print("Removing stat: \(statToMod) feature...")

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
            target?.maxValueDidChange(statType: .MHP, amount: -self.amount)
        }
        
        if statToMod == StatsType.HP {
            target?.currentHP.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.MMP {
            target?.maxMP.modifyBy(val: -self.amount)
            target?.maxValueDidChange(statType: .MMP, amount: -self.amount)
        }
        
        if statToMod == StatsType.MP {
            target?.currentMP.modifyBy(val: -self.amount)
        }
        
        if statToMod == StatsType.LVL {
            target?.lvl.modifyBy(val: -self.amount)
        }
    }
    
    func getInfo() -> String {
        var string = "+\(amount)"
        switch statToMod {
        case .ATK:
            string += "ATK"
        case .DEF:
            string += "DEF"
        case .EVD:
            string += "EVD"
        case .EXP:
            string += "EXP"
        case .HP:
            string += "HP"
        case .LVL:
            string += "LVL"
        case .MAT:
            string += "MAT"
        case .MDF:
            string += "MDF"
        case .MHP:
            string += "MHP"
        case .MMP:
            string += "MMP"
        case .MP:
            string += "MP"
        case .RES:
            string += "RES"
        case .SPD:
            string += "SPD"
        default:
            print("info for \(statToMod) not found")
        }
        return string
    }
}



