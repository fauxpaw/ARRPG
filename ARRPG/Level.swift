//
//  Level.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class Level: Stat {
    
    override init(val: Int) {
        super.init(val: val)
        self.setLowerBound(value: 1)
        self.setUpperBound(value: 99)
    }
}
