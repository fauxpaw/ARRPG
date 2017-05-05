//
//  Annotation.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    //maybe subtitle for level?
    
    init(location: CLLocationCoordinate2D, title: String) {
        self.coordinate = location
        self.title = title
        
        super.init()
    }
}
