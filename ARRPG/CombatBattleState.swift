//
//  CombatBattleState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/4/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class CombatBattleState: BattleState {
    
    override func onEnter() {
        super.onEnter()
        //setup and enable the combat menu
        print("Entering combat state")
        self.setupAttackMenu()
        battleVC.menuController.attackState()
        battleVC.updateStats()
    }
    
    override func onExit() {
        super.onExit()
        print("leaving combat state")
        battleVC.mob = nil
        battleVC.player.target = nil
        battleVC.sceneView.removeMonster()
    }
    
    func setupAttackMenu() {
        self.menuController.attackState()
    }
    
}
