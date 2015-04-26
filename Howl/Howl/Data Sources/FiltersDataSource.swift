//
//  FiltersDataSource.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class FiltersDataSource: NSObject, UITableViewDataSource {
    
    var sectionHeaders: [String]!
    
    override init() {
        sectionHeaders = [ "Most Popular", "Distance", "Sort By", "Categories"]
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
}
