//
//  LootBattleState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class LootBattleState: BattleState {
    
    override func onEnter() {
        print("entering loot state")
        battleVC.menuController.showLootMenu()
        battleVC.mob?.dropItem()
    }
    
    override func onExit() {
        print("leaving loot state")
        battleVC.menuController.hideLootMenu()
    }
    
}
