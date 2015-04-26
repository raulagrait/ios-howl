//
//  FiltersDataSource.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class FiltersDataSource: NSObject, UITableViewDataSource, SwitchCellDelegate {
    
    var sectionHeaders: [String]!
    
    var hasDeals: Bool = false
    
    override init() {
        sectionHeaders = [ "Most Popular", "Distance", "Sort By", "Categories"]
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            var switchCell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
            switchCell.switchLabel.text = "Offering a Deal"
            switchCell.cellSwitch.on = hasDeals
            switchCell.delegate = self
            return switchCell
        default:
            return UITableViewCell()
        }
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
    
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        hasDeals = value
        println(hasDeals)
    }
    
}
