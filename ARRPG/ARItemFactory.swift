//
//  ARItemFactory.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class ARItemFactory {
    private init() { }
    
    static let shared = ARItemFactory()
    
    func createObjectives(fromArrayOfDict arrayInput: [[String: Any]]) -> [ARItem] {
        
        var output = [ARItem]()
        
        for dict in arrayInput {
            
            if let place = ARItem(json: dict) {
                output.append(place)
            }
        }
        
        return output
    }
    

}
