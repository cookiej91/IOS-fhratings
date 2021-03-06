//
//  RestaurantViewController.swift
//  assignment
//
//  Created by JoshC on 08/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation
import UIKit
import MapKit

//Detail view of restaurant on click.
class RestaurantViewController: UIViewController, MKMapViewDelegate {
    
    var restaurant: Restaurant! = nil
    
    override func viewDidLoad() {
        restaurantMap!.showsUserLocation = true
        
        nameLabel.text = restaurant.BusinessName
        addressLabel.text = "Address: \n\(restaurant.AddressLine1)\n \(restaurant.AddressLine2)\n \(restaurant.AddressLine3)"
        ratingLabel.text = "Rating Date: \(restaurant.RatingDate)"
        
        if((restaurant.DistanceKM) != nil) {
            //formatting distance in KM by casting to double and rounding to 3 D.P
            let distance = Double(restaurant.DistanceKM!)
            let formattedNumber = round(distance! * 1000) / 1000
            distanceLabel.text = "Distance in KM: \(formattedNumber)"
        } else {
            distanceLabel.text = "Distance in KM: No information available"
        }
        
        ratingImage.image = UIImage.init(named:"\(ImageHandler.getRatingImage(restaurant.RatingValue)).jpg")
        
        let restaurantLocation2D = CLLocationCoordinate2D(latitude: Double(restaurant.Latitude)!, longitude: Double(restaurant.Longitude)!)
        
        let restaurantLocation = CLLocation(latitude: Double(restaurant.Latitude)!, longitude: Double(restaurant.Longitude)!)
        
        restaurantMap?.delegate = self
        let annotation = HygieneAnnotation()
        annotation.coordinate = restaurantLocation2D
        annotation.title = restaurant.BusinessName
        annotation.rating = "pin\(restaurant.RatingValue)"
        restaurantMap!.addAnnotation(annotation)
        
        centerMapOnLocation(location: restaurantLocation)

    }
    
    //centres within 100m of current location
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        restaurantMap!.setRegion(coordinateRegion, animated: true)
    }
    
    //custom annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = self.restaurantMap!.dequeueReusableAnnotationView(withIdentifier: "pin")
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: (annotation as! HygieneAnnotation).rating)
        return annotationView
    }
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var myLocationPin: UIButton!
    @IBOutlet weak var restaurantMap: MKMapView?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    
}
