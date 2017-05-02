//
//  MainScene.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit
import SceneKit
import CoreLocation

class MainScene: SCNView {
    
    let locationManager = CLLocationManager()
    var heading: Double = 0.0
    var userLocation = CLLocation()
    let cameraNode = SCNNode()
    let targetNode = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
    //var target: ARItem!
    let target = ARItem(itemDescription: "wolf", location: CLLocation(latitude: 47.7487386, longitude: -122.30575994599825), itemNode: SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)))
    
    func setup() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.startUpdatingHeading()
        self.cameraNode.camera = SCNCamera()
        self.cameraNode.position = SCNVector3(0, 0, 10)
        self.scene?.rootNode.addChildNode(cameraNode)
        self.scene?.rootNode.addChildNode(target.itemNode!)
    }
    
    func tearDown() {
        self.locationManager.stopUpdatingHeading()
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func repositionTarget() {
        //1
        let heading = getHeadingForDirectionFromCoordinate(from: userLocation, to: target.location)
        
        //2
        let delta = heading - self.heading
        
         if delta < -15.0 {
         //leftIndicator.isHidden = false
         //rightIndicator.isHidden = true
            print("Go left")
         } else if delta > 15 {
         //leftIndicator.isHidden = true
         //rightIndicator.isHidden = false
            print("Go right")
         } else {
         //leftIndicator.isHidden = true
         //rightIndicator.isHidden = true
            print("Enemy in sight")
         }
        
        //3
        let distance = userLocation.distance(from: target.location)
        //4
        if let node = target.itemNode {
            //5
            if node.parent == nil {
                node.position = SCNVector3(x: Float(delta), y: 0, z: Float(-distance))
                self.scene?.rootNode.addChildNode(node)
                
            } else {
                //6
                node.removeAllActions()
                node.runAction(SCNAction.move(to: SCNVector3(x: Float(delta), y: 0, z: Float(-distance)), duration: 0.2))
                //print("moving node?")
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

extension MainScene: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.heading = fmod(newHeading.trueHeading, 360.0)
        self.repositionTarget()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let current = locations.last else {return}
        self.userLocation = current
    }
}
