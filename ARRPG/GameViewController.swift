//
//  GameViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    public var currentState: State {
        get {return _currentState}
        set { self.transition(state: newValue) }
    }
    
    private var _currentState: State = NullState()
    private var inTransition = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getState(object: GameViewController) -> State {
        
        return self.currentState
    }
    
    func changeState (toState: State) {
        self.currentState = toState
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
