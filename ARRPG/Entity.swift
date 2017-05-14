//
//  Entity.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Entity {
    
    var name = "Cool Name"
    var LVL = Level(val: 1)
    var ATK = Stat(statName: "ATK" ,val: 1)
    var DEF = Stat(statName: "DEF", val: 0)
    var maxHP = Stat(statName: "MHP", val: 1)
    var currentHP = Stat(statName: "HP", val: 1)
    var maxMP = Stat(statName: "MMP", val: 1)
    var currentMP =  Stat(statName: "MP", val: 1)
    var EXP = Stat(statName: "EXP", val: 0) // Current Experience
    var MAT = Stat(statName: "MAT", val: 1) // Base Arcane Attack
    var MDF = Stat(statName: "MDF", val: 0) // Base Arcane Defense
    var EVD = Stat(statName: "EVD", val: 0) // Evade
    var RES = Stat(statName: "RES", val: 0)// Status Resistance
    var SPD = Stat(statName: "SPD", val: 0) // Speed
    var PAT = Stat(statName: "PAT", val: 0) // Piercing Attack
    var CAT = Stat(statName: "CAT", val: 0) // Crushing Attack
    var SAT = Stat(statName: "SAT", val: 0) // Slashing Attack
    var PDF = Stat(statName: "PDF", val: 0) // Piercing Defense
    var CDF = Stat(statName: "CDF", val: 0) // Crushing Defense
    var SDF = Stat(statName: "SDF", val: 0) // Slashing Defense
    var FAT = Stat(statName: "FAT", val: 0) // Fire Attack
    var WAT = Stat(statName: "WAT", val: 0) // Water Attack
    var AAT = Stat(statName: "AAT", val: 0) // Air Attack
    var EAT = Stat(statName: "EAT", val: 0) // Earth Attack
    var FR  = Stat(statName: "FR", val: 0) // Fire Resistance
    var AR  = Stat(statName: "AR", val: 0) // Air Resistance
    var WR  = Stat(statName: "WR", val: 0) // Water Resistance
    var ER  = Stat(statName: "ER", val: 0) // Earth Resistance
    var stats : [Stat]
    
    init() {
        let floor0Stats = [MDF, DEF, EVD, RES, SPD, PAT, CAT, SAT, PDF, CDF, SDF, FAT, WAT, AAT, EAT, FR, AR, WR, ER, currentHP, currentMP, EXP]
        for stat in floor0Stats {
            stat.setLowerBound(value: 0)
        }
        let floor1Stats = [ATK, MAT, LVL, maxHP, maxMP]
        for stat in floor1Stats {
            stat.setLowerBound(value: 1)
        }
        
        self.EXP.setUpperBound(value: 999999)
        self.LVL.setUpperBound(value: 99)
        
        self.stats = [maxHP, maxMP, MDF, DEF, EVD, RES, SPD, PAT, CAT, SAT, PDF, CDF, SDF, FAT, WAT, AAT, EAT, FR, AR, WR, ER, currentHP, currentMP, EXP, ATK, MAT]
    }
    
    func maxValueWasSet(statType: StatsType, amount: Int) {
        switch statType {
        case .MHP:
            let difference = amount - self.currentHP.getValue()
            self.currentHP.setUpperBound(value: amount)
            self.currentHP.modifyBy(val: difference)
        case .MMP:
            let difference = amount - self.currentMP.getValue()
            self.currentMP.setUpperBound(value: amount)
            self.currentMP.modifyBy(val: difference)
        default:
            print("Not a max value, no need for change")
        }
    }
    
    func maxValueDidChange(statType: StatsType, amount: Int) {
        switch statType {
        case .MHP:
            self.currentHP.modifyUpperBound(value: amount)
            self.currentHP.modifyBy(val: amount)
        case .MMP :
            self.currentMP.modifyUpperBound(value: amount)
            self.currentMP.modifyBy(val: amount)
        default:
            print("Not modifying max value, no need for current value max to change")
        }
    }
    
    func levelDidChange() {
        
    }
    
}

