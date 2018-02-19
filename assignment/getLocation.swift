//
//  getLocation.swift
//  assignment
//
//  Created by JoshC on 04/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//
import CoreLocation;
import Foundation;
CLLocationManager();

    var locationManager = CLLocationManager()

    func currentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        var currentLocation: CLLocation!
        currentLocation = locationManager.location
        let latitude = currentLocation!.coordinate.latitude
        let longitude = currentLocation!.coordinate.longitude
    }
