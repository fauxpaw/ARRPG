//
//  Item.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class Item: NSObject {
    
    let name: String
    let desc: String
    let cost: Int
    let sellValue: Int
    
    init(name: String, description: String, cost: Int) {
        self.name = name
        self.desc = description
        self.cost = cost
        self.sellValue = Int(0.5 * Double(cost))
    }
    
}
