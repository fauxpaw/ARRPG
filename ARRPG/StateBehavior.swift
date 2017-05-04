//
//  StateBehavior.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

protocol StateBehavior {
    
    func onEnter()
    func onExit()
    func onDestroy()
    
}
