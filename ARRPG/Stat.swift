//
//  Stats.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class Stat: NSObject {
    
    private var value: Int
    private var maxValue: Int?
    
    init(val: Int) {
        self.value = val
    }
    
    func setValue(to: Int) {
        self.value = to
    }
    
    func getValue() -> Int {
        return self.value
    }
    
    func modifyBy(val: Int) {
        self.value += val
        if self.value < 0 {
            self.value = 0
        }
        
        if let max = self.maxValue {
            if self.value > max {
                self.value = max
            }
        }
    }
}
