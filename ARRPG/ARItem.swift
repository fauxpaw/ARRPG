//
//  ARItem.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//
import CoreLocation
import Foundation
import SceneKit

//information for annotation

struct ARItem {
    
    let itemDescription : String
    let location : CLLocation
    var itemNode: SCNNode?
    
    init(itemDesc: String, loc: CLLocation, node: SCNNode? = nil) {
        self.itemDescription = itemDesc
        self.location = loc
        self.itemNode = node
    }
    
    init? (json: [String: Any]) {
        
        guard let geoDict = json["geometry"] as? [String: Any]  else {print("geoDict not found");return nil }
        guard let locDict = geoDict["location"] as? [String: Any] else {print("locDict not found");return nil}
        
        if let locName = json["name"] as? String, let latitude = locDict["lat"] as? CLLocationDegrees, let longitude = locDict["lng"] as? CLLocationDegrees {
            let loc = CLLocation(latitude: latitude, longitude: longitude)
            self.location = loc
            self.itemDescription = locName
            self.itemNode = nil
        } else {
            print("could not instantiate objective. An 'if let' failed")
            return nil
        }
    }
}
