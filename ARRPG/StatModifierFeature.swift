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
       /* if statToMod == StatsType.ATK {
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
        } */
        
        switch statToMod {
        case .ATK:
            target?.atk.modifyBy(val: self.amount)
        case .DEF:
            target?.def.modifyBy(val: self.amount)
        case .EVD:
            target?.EVD.modifyBy(val: self.amount)
        case .EXP:
            target?.EXP.modifyBy(val: self.amount)
        case .HP:
            target?.currentHP.modifyBy(val: self.amount)
        case .LVL:
            target?.lvl.modifyBy(val: self.amount)
        case .MAT:
            target?.MAT.modifyBy(val: self.amount)
        case .MDF:
            target?.MDF.modifyBy(val: self.amount)
        case .MHP:
            target?.maxHP.modifyBy(val: self.amount)
            target?.maxValueDidChange(statType: .MHP, amount: self.amount)
        case .MMP:
            target?.maxMP.modifyBy(val: self.amount)
            target?.maxValueDidChange(statType: .MMP, amount: self.amount)
        case .MP:
            target?.currentMP.modifyBy(val: self.amount)
        case .RES:
            target?.RES.modifyBy(val: self.amount)
        case .SPD:
            target?.SPD.modifyBy(val: self.amount)
        case .PAT: // Piercing Attack
            target?.PAT.modifyBy(val: self.amount)
        case .CAT :// Crushing Attack
            target?.CAT.modifyBy(val: self.amount)
        case .SAT: // Slashing Attack
            target?.SAT.modifyBy(val: self.amount)
        case .PDF: // Piercing Defense
            target?.PDF.modifyBy(val: self.amount)
        case .CDF: // Crushing Defense
            target?.CDF.modifyBy(val: self.amount)
        case .SDF: // Slashing Defense
            target?.SDF.modifyBy(val: self.amount)
        case .FAT: // Fire Attack
            target?.FAT.modifyBy(val: self.amount)
        case .WAT: // Water Attack
            target?.WAT.modifyBy(val: self.amount)
        case .AAT: // Air Attack
            target?.AAT.modifyBy(val: self.amount)
        case .EAT: // Earth Attack
            target?.EAT.modifyBy(val: self.amount)
        case .FR:  // Fire Resistance
            target?.FR.modifyBy(val: self.amount)
        case .AR:  // Air Resistance
            target?.AR.modifyBy(val: self.amount)
        case .WR:  // Water Resistance
            target?.WR.modifyBy(val: self.amount)
        case .ER:  // Earth Resistance
            target?.ER.modifyBy(val: self.amount)
        }
    }
    
    override func onRemove() {
        
       /* if statToMod == StatsType.ATK {
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
        } */
        
        switch statToMod {
        case .ATK:
            target?.atk.modifyBy(val: -self.amount)
        case .DEF:
            target?.def.modifyBy(val: -self.amount)
        case .EVD:
            target?.EVD.modifyBy(val: -self.amount)
        case .EXP:
            target?.EXP.modifyBy(val: -self.amount)
        case .HP:
            target?.currentHP.modifyBy(val: -self.amount)
        case .LVL:
            target?.lvl.modifyBy(val: -self.amount)
        case .MAT:
            target?.MAT.modifyBy(val: -self.amount)
        case .MDF:
            target?.MDF.modifyBy(val: -self.amount)
        case .MHP:
            target?.maxHP.modifyBy(val: -self.amount)
            target?.maxValueDidChange(statType: .MHP, amount: -self.amount)
        case .MMP:
            target?.maxMP.modifyBy(val: -self.amount)
            target?.maxValueDidChange(statType: .MMP, amount: -self.amount)
        case .MP:
            target?.currentMP.modifyBy(val: -self.amount)
        case .RES:
            target?.RES.modifyBy(val: -self.amount)
        case .SPD:
            target?.SPD.modifyBy(val: -self.amount)
        case .PAT: // Piercing Attack
            target?.PAT.modifyBy(val: -self.amount)
        case .CAT :// Crushing Attack
            target?.CAT.modifyBy(val: -self.amount)
        case .SAT: // Slashing Attack
            target?.SAT.modifyBy(val: -self.amount)
        case .PDF: // Piercing Defense
            target?.PDF.modifyBy(val: -self.amount)
        case .CDF: // Crushing Defense
            target?.CDF.modifyBy(val: -self.amount)
        case .SDF: // Slashing Defense
            target?.SDF.modifyBy(val: -self.amount)
        case .FAT: // Fire Attack
            target?.FAT.modifyBy(val: -self.amount)
        case .WAT: // Water Attack
            target?.WAT.modifyBy(val: -self.amount)
        case .AAT: // Air Attack
            target?.AAT.modifyBy(val: -self.amount)
        case .EAT: // Earth Attack
            target?.EAT.modifyBy(val: -self.amount)
        case .FR:  // Fire Resistance
            target?.FR.modifyBy(val: -self.amount)
        case .AR:  // Air Resistance
            target?.AR.modifyBy(val: -self.amount)
        case .WR:  // Water Resistance
            target?.WR.modifyBy(val: -self.amount)
        case .ER:  // Earth Resistance
            target?.ER.modifyBy(val: -self.amount)
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
        case .PAT: // Piercing Attack
            string += "PAT"
        case .CAT :// Crushing Attack
            string += "CAT"
        case .SAT: // Slashing Attack
            string += "SAT"
        case .PDF: // Piercing Defense
            string += "PDF"
        case .CDF: // Crushing Defense
            string += "CDF"
        case .SDF: // Slashing Defense
            string += "SDF"
        case .FAT: // Fire Attack
            string += "FAT"
        case .WAT: // Water Attack
            string += "WAT"
        case .AAT: // Air Attack
            string += "AAT"
        case .EAT: // Earth Attack
            string += "EAT"
        case .FR:  // Fire Resistance
            string += "FR"
        case .AR:  // Air Resistance
            string += "AR"
        case .WR:  // Water Resistance
            string += "WR"
        case .ER:  // Earth Resistance
            string += "ER"
        default:
            print("info for \(statToMod) not found")
        }
        return string
    }
}



