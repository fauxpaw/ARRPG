//
//  ExperienceCalculator.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/10/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

struct ExperienceCalculator {
    
    static let shared = ExperienceCalculator()
    
    private init() {}
    
    
    func determineExpForMonster(killer: Entity, victim: Entity) {
        //check level
        //let kLvl = killer.lvl.getValue()
        //let vLvl = victim.lvl.getValue()
    }
    
    func levelPercent(entity: Entity) -> Float? {
        
        let lvl = entity.lvl.getValue()
        if let minLvl = entity.lvl.getLowerBound(), let maxLvl = entity.lvl.getUpperBound()  {
            
            return Float(lvl-minLvl) / Float(maxLvl - minLvl)
            
        }
        print("cannot calculate levelPercent properly: Review ExperienceCalculator Struct")
        return nil
    }
    
    func levelPercent(level: Int, maxLevel: Int) -> Float {
        
        let minLvl = 1
        return Float(level-minLvl) / Float(maxLevel - minLvl)
        
    }
    
    func experienceNeededForNextLevel (entity: Entity) -> Int{
        
        guard let maxEXP = entity.EXP.getUpperBound() else {return -1 }
        guard let maxLvl = entity.lvl.getUpperBound() else {return -1 }
        let currentLevel = entity.lvl.getValue()
        let nextLevel = entity.lvl.getValue() + 1
        let percent1 = levelPercent(level: currentLevel, maxLevel: maxLvl)
        let nextPercent = levelPercent(level: nextLevel, maxLevel: maxLvl)
        let value1 = Int(self.easeInQuad(start: 0, end: Float(maxEXP), value: percent1))
        let value2 = Int(self.easeInQuad(start: 0, end: Float(maxEXP), value: nextPercent))
        
        return value2 - value1
    }

    func experienceForLevel(entity: Entity) -> Int? {
        
        guard let maxEXP = entity.EXP.getUpperBound() else {return nil}
        guard let percent = levelPercent(entity: entity) else {return nil}
        
        return Int(self.easeInQuad(start: 0, end: Float(maxEXP), value: percent))
    }
    
    func levelForExperience(entity: Entity) -> Int {
        
        let exp = entity.EXP.getValue()
        if let maxLvl = entity.lvl.getUpperBound() {
            for lvl in (1...maxLvl).reversed() {
                if exp >= self.experienceForLevel(entity: entity)! {
                    return lvl
                }
            }
        }
        
        return entity.lvl.getUpperBound() ?? 99
    }
    
    func easeInQuad(start: Float, end: Float, value: Float) -> Float {
        let diff = end - start
        return diff * value * value + start
    }
    
}

