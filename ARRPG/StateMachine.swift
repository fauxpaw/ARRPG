//
//  StateMachine.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class StateMachine {
    
    static let shared = StateMachine()
    
    public private(set) var currentState: State
    //private var inTransition = false
    
    private init() {
        currentState = State()
    }
    
    func getState(object: GameViewController) -> State {
        
        return object.state
    }
    
    func changeState (to: State) {
        
    }
    
    func transition() {
        
    }
    
}
