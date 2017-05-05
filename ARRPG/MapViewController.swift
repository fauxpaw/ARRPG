//
//  MapViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import MapKit
import CoreLocation

class MapViewController: GameViewController {
    
    //possible states -> worldmap, item menu, equipment menu, null
    fileprivate var startedLoadingPOIs = false
    @IBOutlet weak var mapView: WorldMap!
    var selectedAnnotation: MKAnnotation?
    var userLocation : CLLocation?
    fileprivate let locationManager = CLLocationManager()
    var targets = [ARItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMapView()
        self.changeState(toState: WorldMapState(owner: self))
    }
    
    fileprivate func setupMapView() {
        
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .followWithHeading

    }
    
}

extension MapViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.userLocation = userLocation.location
    }
    
}

extension MapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //1
        if locations.count > 0 {
            let location = locations.last!
            print("Accuracy: \(location.horizontalAccuracy)")
            
            //2
            if location.horizontalAccuracy < 11 {
                //3
                manager.stopUpdatingLocation()
                let span = MKCoordinateSpan(latitudeDelta: 0.014, longitudeDelta: 0.014)
                let region = MKCoordinateRegion(center: location.coordinate, span: span)
                mapView.region = region
                
                //1
                if !startedLoadingPOIs {
                    startedLoadingPOIs = true
                    GooglePlacesAPI.shared.getPlaces(nearLocation: location, radius: 1000, handler: { (rootDic, error) in
                        
                        if let error = error {
                            print("could not get valid JSON root object. check \(error.localizedDescription)")
                        }
                        
                        if let dic = rootDic {
                            guard let array = JSONParser.dictionaryRootToArrayOfDict(rootObj: dic, key: "results") else {return}
                            
                            self.targets = ARItemFactory.shared.createObjectives(fromArrayOfDict: array)
                        }
                        
                    })
                }
            }
        }
    }
}
