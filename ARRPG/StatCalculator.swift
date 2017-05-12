//
//  StatCalculator.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/9/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


struct StatCalculator {
    
    static let shared = StatCalculator()
    
    let statGrowth: [String: Double] = ["MHP" : 10,
                                        "MMP" : 2,
                                        "HP" : 10,
                                        "MP" : 2,
                                        "RES" : 0.1,
                                        "SPD" : 0.1,
                                        "EVD" : 0.4,
                                        "ATK" : 1.2,
                                        "PAT" : 0.1,
                                        "CAT" : 0.1,
                                        "SAT" : 0.1,
                                        "MAT" : 1.2,
                                        "EAT" : 0.2,
                                        "FAT" : 0.2,
                                        "AAT" : 0.2,
                                        "WAT" : 0.2,
                                        "DEF" : 0.4,
                                        "PDF" : 0.1,
                                        "CDF" : 0.1,
                                        "SDF" : 0.1,
                                        "MDF" : 0.4,
                                        "ER" : 0.2,
                                        "FR" : 0.2,
                                        "AR" : 0.2,
                                        "WR" : 0.2 ]
    
    private init () {}
    
    func reCalcBaseStats(entity: Entity) {
        let lvl = entity.lvl.getValue()
        //calculate base stats
        for stat in entity.stats {
            let name = stat.getName()
            if let multiplier = statGrowth[name] {
                let newValue = Int(Double(lvl) * multiplier)
                print("Setting \(stat.getName()) to \(newValue)")
                stat.setValue(to: newValue)
            }
        }
    }
    
    func applyItemBonues(entity: Entity) {
        if let player = entity as? Character {
            for item in player.itemsEquipped {
                for mod in item.effects {
                    mod.onApply()
                }
            }
        }
    }
}
