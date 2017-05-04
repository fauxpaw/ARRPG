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
    
    public var currentState: State {
        get {return _currentState}
        set { self.transition(state: newValue) }
    }
    
    private var _currentState: State
    private var inTransition = false
    
    
    private init() {
        _currentState = NullState()
    }
    
    func getState(object: GameViewController) -> State {
        
        return object.state
    }
    
    func changeState (to: State) {
        
    }
    
    fileprivate func transition(state: State) {
        
        if state == _currentState || inTransition {
            return
        }
        
        inTransition = true
        _currentState.onExit()
        _currentState = state
        _currentState.onEnter()
        inTransition = false
    }
    
}
