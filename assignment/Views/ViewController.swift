//
//  ViewController.swift
//  gpsLocation
//
//  Created by JoshC on 31/01/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ApiHandler.restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = placesTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! RestaurantTableViewCell
        cell.restaurant = ApiHandler.restaurants[indexPath.row]
        let restaurantValue = cell.restaurant?.RatingValue
        let restaurantName = cell.restaurant?.BusinessName
        cell.restaurantName.text = restaurantName
        cell.hygieneImage.image = UIImage.init(named: "\(ImageHandler.getRatingImage(restaurantValue!)).jpg")
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiHandler.getFromLocation(query: location().currentLocation(), complete: complete)
        placesTable.dataSource = self
        placesTable.delegate = self
        searchBar.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //segue - ready for view change
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as? RestaurantTableViewCell
        let getRestaurant = cell?.restaurant
        if let yourVC = segue.destination as? RestaurantViewController {
            yourVC.restaurant = getRestaurant
        }
    }
    
    /*
    new segue to map view when map tab button is pressed in mapList new segue to Listview unless narrator takes you back to listview*/
    
    //async reload data
    func complete() {
        print(ApiHandler.restaurants)
        self.placesTable.reloadData();
    }
    
    //gets data from searchTextBar and passes it through apihandler calls
    func search() {
        let text = searchBar.text
        let segmentIndex = searchType.selectedSegmentIndex
        
        switch segmentIndex {
        case 0:
            return ApiHandler.getFromPostcode(query: text!, complete: complete)
        case 1:
            return ApiHandler.getFromName(query: text!, complete: complete)
            
        case 2:
            return ApiHandler.getFromLocation(query: location().currentLocation(), complete: complete)
        default: ApiHandler.getFromLocation(query: location().currentLocation(), complete: complete)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search();
    }
    
    
    @IBOutlet weak var searchType: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var placesTable: UITableView!
}

