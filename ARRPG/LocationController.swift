//
//  LocationController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import CoreLocation
import SceneKit

class LocationController: NSObject  {
    
    var scene = SCNScene()
    let locationManager = CLLocationManager()
    var heading: Double = 0.0
    var userLocation = CLLocation()
    var target: ARItem!
    
    func setup() {
        self.locationManager.delegate = self
        self.locationManager.startUpdatingHeading()
    }
    
    func repositionTarget() {
        //1
        let heading = getHeadingForDirectionFromCoordinate(from: userLocation, to: target.location)
        
        //2
        let delta = heading - self.heading
        /*
        if delta < -15.0 {
            leftIndicator.isHidden = false
            rightIndicator.isHidden = true
        } else if delta > 15 {
            leftIndicator.isHidden = true
            rightIndicator.isHidden = false
        } else {
            leftIndicator.isHidden = true
            rightIndicator.isHidden = true
        }
        */
        //3
        let distance = userLocation.distance(from: target.location)
        
        //4
        if let node = target?.itemNode {
            
            //5
            if node.parent == nil {
                node.position = SCNVector3(x: Float(delta), y: 0, z: Float(-distance))
                scene.rootNode.addChildNode(node)
            } else {
                //6
                node.removeAllActions()
                node.runAction(SCNAction.move(to: SCNVector3(x: Float(delta), y: 0, z: Float(-distance)), duration: 0.2))
            }
        }
    }
    
    func radiansToDegrees(_ radians: Double) -> Double {
        return (radians) * (180.0 / M_PI)
    }
    
    func degreesToRadians(_ degrees: Double) -> Double {
        return (degrees) * (M_PI / 180.0)
    }
    
    func getHeadingForDirectionFromCoordinate(from: CLLocation, to: CLLocation) -> Double {
        //1
        let fLat = degreesToRadians(from.coordinate.latitude)
        let fLng = degreesToRadians(from.coordinate.longitude)
        let tLat = degreesToRadians(to.coordinate.latitude)
        let tLng = degreesToRadians(to.coordinate.longitude)
        
        //2
        let degree = radiansToDegrees(atan2(sin(tLng-fLng)*cos(tLat), cos(fLat)*sin(tLat)-sin(fLat)*cos(tLat)*cos(tLng-fLng)))
        
        //3
        if degree >= 0 {
            return degree
        } else {
            return degree + 360
        }
    }
    
}

extension LocationController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        self.heading = fmod(newHeading.trueHeading, 360.0)
        self.repositionTarget()
    }
    
}
