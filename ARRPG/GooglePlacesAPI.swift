//
//  GooglePlacesAPI.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import CoreLocation

class GooglePlacesAPI {
    
    static let shared = GooglePlacesAPI()
    private init() {}
    
    
    let apiURL = "https://maps.googleapis.com/maps/api/place/"
    let apiKey = "AIzaSyCyK0N0v5-vHQ9FrMSpxGorkb42k9QUdQk"
    let nearbySearchString = "nearbysearch/json?location="
    
    //fetch list of places near a specified location
    
    func getPlaces(nearLocation location: CLLocation, radius: Int, handler: @escaping ([String: Any]?, NSError?) -> Void) {
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        let uri = "\(apiURL)\(nearbySearchString)\(latitude),\(longitude)&radius=\(radius)&sensor=true&types=establishment&key=\(apiKey)"
        let url = URL(string: uri)!
        let urlSession = URLSession(configuration: .default)
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                //switch on response codes????
                if httpResponse.statusCode == 200 {
                    
                    //remove this responsibility to jsonparser
                    do {
                        let responseObject = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        guard let responseDict = responseObject as? [String: Any] else { return }
                        handler(responseDict, nil)
                        
                    } catch let error as NSError {
                        handler(nil, error)
                    }
                }
            }
        }
        dataTask.resume()
    }

    
}
