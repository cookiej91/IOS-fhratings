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
        mapView.delegate = self
        populateMapList()
    }
    
    //MapKitView populated with restaurants
    func populateMapList() {
        for restaurant in ApiHandler.restaurants {
            let restaurantLocation2D = CLLocationCoordinate2D(latitude: Double(restaurant.Latitude)!, longitude: Double(restaurant.Longitude)!)
            let restaurantLocation = CLLocation(latitude: Double(restaurant.Latitude)!, longitude: Double(restaurant.Longitude)!)
            userLocation().userCurrentLocation()
            let annotation = HygieneAnnotation()
            annotation.rating = "pin\(restaurant.RatingValue)"
            
            annotation.coordinate = restaurantLocation2D
            annotation.title = restaurant.BusinessName
            
            mapView.addAnnotation(annotation)
            centerMapOnLocation(location: restaurantLocation)
        }
    }
    
    //centres within 500m of current location
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView?.setRegion(coordinateRegion, animated: true)
        
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    //custom annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: (annotation as! HygieneAnnotation).rating)
        return annotationView
    }

    
    @IBOutlet weak var mapView: MKMapView!
}
