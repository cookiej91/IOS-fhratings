//
//  ImageHandler.swift
//  assignment
//
//  Created by JoshC on 08/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation

//image names related to rating value
class ImageHandler {
    static func getRatingImage(_ rating: String ) -> String {
        switch rating {
        case "-1", "1", "2", "3", "4", "5" :
            return rating
        default:
            return "awaitingpublication"
        }
    }
}
