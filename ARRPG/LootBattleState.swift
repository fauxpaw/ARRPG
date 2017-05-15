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
       
        battleVC.menuController.lootState()
        battleVC.mob?.dropItem()
    }
    
    override func onExit() {
        print("leaving loot state")
    }
    //TODO: replace these in each battlestate with setup at initialize!
    
    
}
