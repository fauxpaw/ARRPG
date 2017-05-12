//
//  Stats.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class Stat: NSObject {
    
    let name: String
    private var value: Int
    private var maxValue: Int?
    private var minVlaue: Int?
    
    init(statName: String, val: Int) {
        self.value = val
        self.name = statName
    }
    
    func setValue(to: Int) {
        self.value = to
        
        if let min = self.minVlaue {
            if self.value < min {
                self.value = min
            }
        }
        guard let max = self.maxValue else {return}
        if self.value > max {
            self.value = max
        }
    }
    
    func getValue() -> Int {
        return self.value
    }
    
    func modifyBy(val: Int) {
        self.value += val
        
        if self.value < 0 {
            self.value = 0
        }
        
        guard let max = self.maxValue else {return}
        if self.value > max {
            self.value = max
        }
    }
    
    func setUpperBound(value: Int) {
        self.maxValue = value
    }
    
    func getUpperBound() -> Int? {
        if let max = self.maxValue {
            return max
        }
        return nil
    }
    
    func setLowerBound(value: Int) {
        self.minVlaue = value
    }
    
    func getLowerBound() -> Int? {
        if let min = self.minVlaue {
            return min
        }
        return nil
    }
    
    func modifyUpperBound(value: Int) {
        if var max = self.maxValue {
            max += value
            self.maxValue = max
        }
    }
    
    func modifyLowerBound(value: Int) {
        if var min = self.minVlaue {
            min += value
            self.minVlaue = min
        }
    }
    
    func getName() -> String {
        return self.name
    }
    
}
