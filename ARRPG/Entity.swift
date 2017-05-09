//
//  Entity.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Entity {
    
    var lvl = Level(val: 1)
    var atk = Attack(val: 1)
    var def = Stat(val: 0)
    var maxHP = Stat(val: 1)
    var currentHP = Stat(val: 1)
    var maxMP = Stat(val: 1)
    var currentMP =  Stat(val: 1)
    var EXP = Stat(val: 0) // Base Arcane Attack
    var MAT = Stat(val: 1) // Base Arcane Attack
    var MDF = Stat(val: 0) // Base Arcane Defense
    var EVD = Stat(val: 0) // Evade
    var RES = Stat(val: 0) // Status Resistance
    var SPD = Stat(val: 0) // Speed
    var PAT = Stat(val: 0) // Piercing Attack
    var CAT = Stat(val: 0) // Crushing Attack
    var SAT = Stat(val: 0) // Slashing Attack
    var PDF = Stat(val: 0) // Piercing Defense
    var CDF = Stat(val: 0) // Crushing Defense
    var SDF = Stat(val: 0) // Slashing Defense
    var FAT = Stat(val: 0) // Fire Attack
    var WAT = Stat(val: 0) // Water Attack
    var AAT = Stat(val: 0) // Air Attack
    var EAT = Stat(val: 0) // Earth Attack
    var FR  = Stat(val: 0) // Fire Resistance
    var AR  = Stat(val: 0) // Air Resistance
    var WR  = Stat(val: 0) // Water Resistance
    var ER  = Stat(val: 0) // Earth Resistance
    
    init() {
        let floor0Stats = [MDF, def, EVD, RES, SPD, PAT, CAT, SAT, PDF, CDF, SDF, FAT, WAT, AAT, EAT, FR, AR, WR, ER, currentHP, currentMP, EXP]
        for stat in floor0Stats {
            stat.setLowerBound(value: 0)
        }
        let floor1Stats = [atk, MAT, lvl, maxHP, maxMP]
        for stat in floor1Stats {
            stat.setLowerBound(value: 1)
        }
    }
    
    func maxValueDidChange(statType: StatsType, amount: Int) {
        switch statType {
        case .MHP:
            self.currentHP.modifyUpperBound(value: amount)
            guard let upper = self.currentHP.getUpperBound() else {return}
            if self.currentHP.getValue() > upper {
                self.currentHP.setValue(to: upper)
            }
        case .MMP :
            self.currentMP.modifyUpperBound(value: amount)
            guard let upper = self.currentMP.getUpperBound() else {return}
            if self.currentMP.getValue() > upper {
                self.currentMP.setValue(to: upper)
            }
        default:
            print("Not modifying max value, no need for current value max to change")
        }
    }
    
}

