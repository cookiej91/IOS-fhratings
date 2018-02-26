//
//  location.swift
//  assignment
//
//  Created by JoshC on 04/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation;
import CoreLocation;

//Gets current location to pass through to API handler
class location: CLLocationManager {
    var locationManager: CLLocationManager!
    
    func currentLocation() -> String {
        locationManager = CLLocationManager()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        var currentLocation: CLLocation!
        currentLocation = locationManager.location
        let latitude = currentLocation!.coordinate.latitude
        let longitude = currentLocation!.coordinate.longitude
        let locationString = "loc&lat=\(latitude)&long=\(longitude)"
        return locationString
    }
}
