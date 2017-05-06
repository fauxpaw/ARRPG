//
//  Item.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Item: NSObject {
    
    var owner: Character?
    let name: String
    let desc: String
    let cost: Int
    let sellValue: Int
    
    init(name: String, description: String, cost: Int, owner: Character? = nil) {
        self.name = name
        self.desc = description
        self.cost = cost
        self.owner = owner
        self.sellValue = Int(0.5 * Double(cost))
    }
    
}
