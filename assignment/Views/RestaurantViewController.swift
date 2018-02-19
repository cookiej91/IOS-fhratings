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
class RestaurantViewController: UIViewController {
    
    var restaurant: Restaurant! = nil
    
    override func viewDidLoad() {
        restaurantMap!.showsUserLocation = true
        nameLabel.text = restaurant.BusinessName
        addressLabel.text = "Address: \n\(restaurant.AddressLine1)\n \(restaurant.AddressLine2)\n \(restaurant.AddressLine3)"
        ratingLabel.text = "Rating Date: \(restaurant.RatingDate)"
        distanceLabel.text = "Distance in KM: \(restaurant.DistanceKM!)"
        
        ratingImage.image = UIImage.init(named:"\(ImageHandler.getRatingImage(restaurant.RatingValue)).jpg")
        
        let restaurantLocation2D = CLLocationCoordinate2D(latitude: Double(restaurant.Latitude)!, longitude: Double(restaurant.Longitude)!)
        
        let restaurantLocation = CLLocation(latitude: Double(restaurant.Latitude)!, longitude: Double(restaurant.Longitude)!)
        
        let annotation = MKPointAnnotation()
        
        let regionRadius: CLLocationDistance = 500
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
            restaurantMap?.setRegion(coordinateRegion, animated: true)
        }
        annotation.coordinate = restaurantLocation2D
        annotation.title = restaurant.BusinessName
        
      //  restaurantMap?.addAnnotation(annotation)
        centerMapOnLocation(location: restaurantLocation)

    }
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var myLocationPin: UIButton!
    @IBOutlet weak var restaurantMap: MKMapView?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    
}
