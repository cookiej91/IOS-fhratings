//
//  RestaurantTableViewCell.swift
//  assignment
//
//  Created by JoshC on 08/02/2018.
//  Copyright © 2018 JoshC. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    var restaurant: Restaurant? = nil
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var hygieneImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
