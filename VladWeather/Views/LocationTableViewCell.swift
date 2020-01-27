//
//  LocationTableViewCell.swift
//  VladWeather
//
//  Created by Vladislav Petrov on 27.01.2020.
//  Copyright © 2020 Vladislav Petrov. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    static let identifier = "LocationTableViewCell"
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var location: Location!
    
    func configure(with location: Location) {
        self.location = location
        self.locationLabel.text = location.name
    }
}
