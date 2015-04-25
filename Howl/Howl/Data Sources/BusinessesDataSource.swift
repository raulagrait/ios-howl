//
//  BusinessesDataSource.swift
//  Howl
//
//  Created by Raul Agrait on 4/24/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class BusinessesDataSource: NSObject, UITableViewDataSource {
    
    var businesses: [Business]?
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let businesses = businesses {
            var business = businesses[indexPath.row]
            cell.textLabel?.text = business.name!
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let businesses = businesses {
            return businesses.count
        }
        return 0
    }
}
