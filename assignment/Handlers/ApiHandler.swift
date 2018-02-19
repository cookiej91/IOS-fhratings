//
//  ApiHandler.swift
//  assignment
//
//  Created by JoshC on 05/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import Foundation

//extension to add a replace function to Strings
extension String
{
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}

//Handles all call to the api and fills resturants with content decoding JSON
class ApiHandler {
    
    //standard api call
    static let url = "http://radikaldesign.co.uk/sandbox/hygiene.php?op=s_"
    static var restaurants = [Restaurant]()
    
    static func getFromLocation(query: String, complete: @escaping () -> Void) -> Void {
        let currentLocation = query;
        getRestaurants(queryString: "\(url)\(currentLocation)", complete: complete)
    }
    
    static func getFromPostdode(query: String, complete: @escaping () -> Void) -> Void {
        let postcode = query;
        getRestaurants(queryString: "\(url)postcode&postcode=\(postcode)", complete: complete)
    }
    
    static func getFromName(query: String, complete: @escaping () -> Void) -> Void {
        let name = query
        let modifiedName = name.replace(target: " ", withString:"%20")
        getRestaurants(queryString: "\(url)name&name=\(modifiedName)", complete: complete)
    }

    class func getRestaurants(queryString: String, complete: @escaping () -> Void) -> Void {
        let newUrl = URL(string: queryString)
        URLSession.shared.dataTask(with: newUrl!) { (data, response, error) in
            guard let data = data else { print ("error with data"); return }
            do {
                self.restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                
                DispatchQueue.main.async {
                    complete()
                }
            } catch let err {
                print ("Error:", err)
            }
            }.resume();
        return ;
    }
}


