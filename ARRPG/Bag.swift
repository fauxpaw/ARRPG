//
//  Bag.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/10/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class Bag {
    
    var capacity: Int = 30
    var contents = [Item]()
    var stacked = [String : Int]()
    
    func addItem(item: Item) {
        
        if contents.count >= capacity {
            print("cannot add more items to bag. Bag is full")
           return
        }
        
        if let _ = item as? StackableItem {
            print("found stackable item")
            if let count = stacked[item.name] {
                print("count for item is \(count)")
                if count > 0 {
                    stacked[item.name] = count + 1
                    return
                }
            } else {
                contents.append(item)
                stacked[item.name] = 1
                print("creating key for item \(stacked[item.name])")
                return
            }
        }
        
        contents.append(item)
    }
    
    func remove(item: Item) {
        
        if let stackable = item as? StackableItem {
            if let count = stacked[item.name] {
                if count == 1 {
                    stacked[item.name] = nil
                    return
                } else {
                    stacked[item.name] = count - 1
                    return
                }
            }
        }
        
        for (i, ele) in contents.enumerated() {
            if item == ele {
                print("removing item from bag contents")
                self.contents.remove(at: i)
            }
        }
    }
}
