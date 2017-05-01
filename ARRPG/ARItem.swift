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
    
}
