//
//  Restaurant.swift
//  assignment
//
//  Created by JoshC on 05/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation

//Restaurant constructor
struct Restaurant: Codable {
    let id: String
    let BusinessName: String
    let AddressLine1: String
    let AddressLine2: String
    let AddressLine3: String
    let PostCode: String
    let RatingValue: String
    let RatingDate: String
    let Longitude: String
    let Latitude: String
    let DistanceKM: String?
}
