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
        //disable the combat menu
    
    }
    
    func setupAttackMenu() {
        battleVC.attackButton.setImage(UIImage(named: "sword")?.withRenderingMode(.alwaysOriginal), for: .normal)
        battleVC.magicButton.setImage(UIImage(named: "tome")?.withRenderingMode(.alwaysOriginal), for: .normal)
        battleVC.itemButton.setImage(UIImage(named: "scroll")?.withRenderingMode(.alwaysOriginal), for: .normal)
        battleVC.runButton.setImage(UIImage(named: "x")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        menuController.battleMenu.buttons.append(battleVC.attackButton)
        menuController.battleMenu.buttons.append(battleVC.magicButton)
        menuController.battleMenu.buttons.append(battleVC.itemButton)
        menuController.battleMenu.buttons.append(battleVC.runButton)
        menuController.battleMenu.buttons.append(battleVC.lootButton)
        self.menuController.attackState()
    }
    
}
