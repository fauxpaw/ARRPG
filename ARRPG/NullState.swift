//
//  NullState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class NullState: State {
    
    override func onEnter() {
        print("entering null state")
    }
    
    override func onExit() {
        print("exiting null state")
    }
}
