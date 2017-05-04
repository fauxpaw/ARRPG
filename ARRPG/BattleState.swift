//
//  BattleState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class BattleState : State {
    
    override func onDestroy() {

    }
    
    override func onExit() {
        print("leaving battle state")
    }
    
    override func onEnter() {
        print("entering battle state")
    }
    
    override func addListeners() {
        //anything we need to broadcast
    }
    
    override func removeListeners() {
        //remove broadcast observers
    }
}
