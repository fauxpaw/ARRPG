//
//  KOBattleState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/13/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class KOBattleState: BattleState {
    
    override func onEnter() {
        print("entering player KO'd state")
        menuController.koState()
        battleVC.player.target = nil
        battleVC.mob = nil
        print("apply some exp loss")
        print("monster flees")
        print("Show revive menu...")
        
    }
    
    override func onExit() {
        print("leaving KO'd state")
    }    
}
