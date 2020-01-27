//
//  MasterViewController.swift
//  VladWeather
//
//  Created by Vladislav Petrov on 26.01.2020.
//  Copyright © 2020 Vladislav Petrov. All rights reserved.
//

import UIKit
import CoreData

class LocationsViewController: UIViewController {
    
    let locations = [
        Location(name: "Current Location", isCurrent: true),
    ]
    
    var selectedCellIndexPath = IndexPath(row: 4, section: 0)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LocationSegue" {
            let vc = segue.destination as! LocationViewController
            let cell = sender as! LocationTableViewCell
            vc.location = cell.location
        }
    }
}

extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as! LocationTableViewCell
        
        cell.configure(with: locations[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = locations[indexPath.row]
        
        if location.isCurrent {
            performSegue(withIdentifier: "CurrentLocationSegue", sender: self)
        } else {
            performSegue(withIdentifier: "LocationSegue", sender: self)
        }
        
        selectedCellIndexPath = indexPath
        tableView.reloadData()
    }
    
}
