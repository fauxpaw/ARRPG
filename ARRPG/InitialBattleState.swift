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
        super.onEnter()
        //spawn & setup the players and monsters
        print("Enter init battle state")
        self.setupMobs()
        
    }
    
    override func onExit() {
        super.onExit()
        //release the players and monsters
        print("Exit init battle state")
    }
    
    func setupPlayers() {
        
        //load in the players data
        //assign the players target
    }
    
    func setupMobs(){
        //load monster data
        //add 3d model to scene
        self.battleVC.mob = Monster(target: self.battleVC.player)
        self.battleVC.player.target = self.battleVC.mob
    }
    
}
