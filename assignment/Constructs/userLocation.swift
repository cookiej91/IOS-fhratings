//
//  userLocation.swift
//  assignment
//
//  Created by JoshC on 26/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation
import CoreLocation

class userLocation: CLLocationManager {
    var locationManager : CLLocationManager!
    static var latitude = 0.0;
    static var longitude = 0.0;
    func userCurrentLocation() -> Void {
        locationManager = CLLocationManager()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        var currentLocation: CLLocation!
        currentLocation = locationManager.location
        userLocation.latitude = currentLocation!.coordinate.latitude
        userLocation.longitude = currentLocation!.coordinate.longitude
    }
}
