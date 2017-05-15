//
//  HitRateCalculator.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/14/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class HitRateCalculator {
    
    static let shared = HitRateCalculator()
    private init() {}
    
    func hitCheck(attacker: Entity, defender: Entity) -> Double  {
        
        //if attack is auto-hit return 1.0
        //if attack has constant hit chance return it
        let eva = Double(defender.EVD.getValue())
        let acc = Double(attacker.ACC.getValue())
        let atklvl = Double(attacker.LVL.getValue())
        let deflvl = Double(defender.LVL.getValue())
        
        let lvlDiff = (atklvl - deflvl) / 100
        let chance: Double = Double(95.0/(100.0 + 2.0 * eva)) + Double(acc/300.0) + lvlDiff
        return chance
        
    }
    
    func willAttackHit(attacker: Entity, defender: Entity) -> Bool {
        let chance = self.hitCheck(attacker: attacker, defender: defender)
        let threshold = drand48()
        print("Chance: \(chance)")
        print("threshold \(threshold)")
        if chance >= threshold {
            return true
        } else {
            print("attack misses")
            return false
        }
    }
}
