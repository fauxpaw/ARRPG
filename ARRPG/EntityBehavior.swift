//
//  Character.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

protocol EntityBehavior {
    
    func attack()
    func takeDmg(amount: Int)
    func expire()
    func consume()
    
}
