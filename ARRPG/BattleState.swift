//
//  BattleState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class BattleState : State {
    
    let battleVC: BattleViewController
    var menuController : BattleMenuController { get {return battleVC.menuController}}
    
    init(owner: BattleViewController) {
        self.battleVC = owner
    }
    
    override func onDestroy() {}
    
    override func onExit() {}
    
    override func onEnter() {}
    
    override func addListeners() {}
    
    override func removeListeners() {}
}
