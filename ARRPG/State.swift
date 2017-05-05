//
//  State.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

//abstract base class
class State : NSObject, StateBehavior {
    
    func onEnter() {
        self.addListeners()
    }
    
    func onDestroy() {
        self.removeListeners()
    }
    
    func onExit() {
        self.removeListeners()
    }
    
    deinit {
        self.removeListeners()
    }
    
    func addListeners() {
        
    }
    
    func removeListeners() {
        
    }
}
