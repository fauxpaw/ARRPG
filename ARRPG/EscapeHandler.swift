//
//  EscapeHandler.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/15/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class EscapeHandler {
    
    static let shared = EscapeHandler()
    private init() {}
    
    func willEscape(player: Entity, monster: Entity) -> Bool {
        
        let playerSPD = Double(player.SPD.getValue())
        let monsterSPD = Double(monster.SPD.getValue())
        
        let delta = playerSPD - monsterSPD
        let chance = 85/(100-delta)
        let threshold = drand48()
        if chance >= threshold {
            return true
        } else {
            return false
        }
        
    }
    
}
