//
//  MapListViewController.swift
//  assignment
//
//  Created by JoshC on 09/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapListViewController: UIViewController, MKMapViewDelegate {
    override func viewDidLoad() {
        mapView!.showsUserLocation = true;
        populateMapList()
    }
    
    //MapKitView populated with restaurants
    func populateMapList() {
        for restaurant in ApiHandler.restaurants {
            let restaurantLocation2D = CLLocationCoordinate2D(latitude: Double(restaurant.Latitude)!, longitude: Double(restaurant.Longitude)!)
            userLocation().userCurrentLocation()
            let currentLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = restaurantLocation2D
            annotation.title = restaurant.BusinessName
            
            mapView.addAnnotation(annotation)
            centerMapOnLocation(location: currentLocation)
        }
    }
    
    //centres within 100m of current location
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView?.setRegion(coordinateRegion, animated: true)
        print(mapView.userLocation.coordinate)
    }
    
    //custom annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if annotationView == nil{
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = false
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "1")
        return annotationView
    }

    
    @IBOutlet weak var mapView: MKMapView!
}
