//
//  HygieneAnnotation.swift
//  assignment
//
//  Created by JoshC on 26/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation
import MapKit

class HygieneAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var phone: String!
    var name: String!
    var address: String!
    var image: UIImage!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
