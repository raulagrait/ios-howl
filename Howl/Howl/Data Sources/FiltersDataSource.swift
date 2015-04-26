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
    var sortOptionTitles: [String]!
    
    var hasDeals: Bool = false
    var sortMode: YelpSortMode = .BestMatched
    
    override init() {
        sectionHeaders = [ "Most Popular", "Distance", "Sort By", "Categories"]
        sortOptionTitles = ["Best Matched", "Distance", "Highest Rated"]
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            var switchCell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
            switchCell.switchLabel.text = "Offering a Deal"
            switchCell.cellSwitch.on = hasDeals
            switchCell.delegate = self
            return switchCell
        case 2:
            var distanceCell = tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath) as! SortCell
            var index = indexPath.row
            distanceCell.textLabel?.text = sortOptionTitles[index]
            var accessoryType = (sortMode.rawValue == index) ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
            distanceCell.accessoryType = accessoryType
            return distanceCell;
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 2:
            return sortOptionTitles.count
        default:
            return 0
        }
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
