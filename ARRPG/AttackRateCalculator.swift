//
//  AttackRateCalculator.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/14/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class AttackRateCalculator {
    
    static let shared = AttackRateCalculator()
    private init() {}
    
    func getNextAttack(entity: Entity) -> TimeInterval {
        
        let spd = entity.SPD.getValue()
        switch spd {
        case 0..<50:
            return TimeInterval(2)
        case 50..<100:
            return TimeInterval(1.5)
        case 100..<150:
            return TimeInterval(1)
        case 150..<200:
            return TimeInterval(0.5)
        default:
            return TimeInterval(2)
        }
    }
}
