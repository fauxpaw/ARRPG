//
//  JSONParser.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//


import Foundation

class JSONParser {
    
    func dataToDictionaryRootObject(data: Data) -> [String: Any]? {
        
        do {
            if let rootObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                return rootObject
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
        return nil
    }
    
    class func dictionaryRootToArrayOfDict(rootObj: [String: Any], key: String) -> [[String: Any]]? {
        
        let array : [[String: Any]] = rootObj[key] as! [[String: Any]]
        return array
        
    }
    
}
