//
//  InitialBattleState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/4/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class InitialBattleState: BattleState {
    
    override func onEnter() {
        //spawn, setup the players and monsters
        print("Enter init battle state")
    }
    
    override func onExit() {
        //release the players and monsters
        print("Exit init battle state")
    }
    
}
