//
//  BusinessesDataSource.swift
//  Howl
//
//  Created by Raul Agrait on 4/24/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class BusinessesDataSource: NSObject, UITableViewDataSource{
    
    var businesses: [Business]?
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as? BusinessCell, businesses = businesses {
            cell.business = businesses[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let businesses = businesses {
            return businesses.count
        }
        return 0
    }
}
