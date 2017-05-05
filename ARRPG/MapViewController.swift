//
//  MapViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import MapKit


class MapViewController: GameViewController {
    
    @IBOutlet weak var mapView: WorldMap!
    //location manager?
    //states -> item menu, equipment menu, null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMapView()
        
    }
    
    fileprivate func setupMapView() {
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .followWithHeading
    }
    
}

extension MapViewController : MKMapViewDelegate {
    
    
    
}
