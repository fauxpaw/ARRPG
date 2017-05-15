//
//  InitialBattleState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/4/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class InitialBattleState: BattleState {
    
    override func onEnter() {
        super.onEnter()
        //spawn & setup the players and monsters
        print("Enter init battle state")
        self.attachButtonsToMenus()
        menuController.setup()
        self.setupAR()
        self.setupMobs()
        
    }
    
    override func onExit() {
        super.onExit()
        //release the players and monsters
        print("Exit init battle state")
    }
    
    fileprivate func attachButtonsToMenus() {
        //combat menu
        battleVC.attackButton.setImage(UIImage(named: "sword")?.withRenderingMode(.alwaysOriginal), for: .normal)
        battleVC.magicButton.setImage(UIImage(named: "tome")?.withRenderingMode(.alwaysOriginal), for: .normal)
        battleVC.itemButton.setImage(UIImage(named: "scroll")?.withRenderingMode(.alwaysOriginal), for: .normal)
        battleVC.runButton.setImage(UIImage(named: "x")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        battleVC.menuController.battleMenu.buttons = [battleVC.attackButton, battleVC.magicButton, battleVC.itemButton, battleVC.runButton]
        //loot menu
        battleVC.menuController.lootMenu.buttons = [battleVC.lootButton]
        //ko menu
        battleVC.menuController.koMenu.buttons = [battleVC.reviveButton]
    }
    
    fileprivate func setupPlayers() {
        
        //load in the players data
        //assign the players target
    }
    
    fileprivate func setupMobs(){
        //load monster data
        //add 3d model to scene
        self.battleVC.sceneView.setup()
        self.battleVC.mob = Monster(withLvl: 3, target: self.battleVC.player)
        
        self.battleVC.player.target = self.battleVC.mob
    }
    
    fileprivate func setupAR() {
        self.battleVC.arController.setup(withView: self.battleVC.view)
    }
    
    
}
