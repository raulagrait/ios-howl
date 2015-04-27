//
//  FiltersDataSource.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class FiltersDataSource: NSObject, UITableViewDataSource, SwitchCellDelegate, DistanceCellDelegate, SortCellDelegate {
    
    var sectionHeaders: [String]!
    var sortOptionTitles: [String]!
    var distanceTitles: [String]!
    
    var hasDeals: Bool
    var distanceIndex: Int
    var sortMode: YelpSortMode
    
    override init() {
        hasDeals = false
        distanceIndex = 0
        sortMode = .BestMatched
        
        sectionHeaders = [ "Most Popular", "Distance", "Sort By", "Categories"]
        sortOptionTitles = ["Best Matched", "Distance", "Highest Rated"]
        distanceTitles = [ "0.25 miles", "0.5 miles", "1 mile", "2 miles", "5 miles" ]
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var index = indexPath.row
        switch indexPath.section {
        case 0:
            var switchCell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
            switchCell.switchLabel.text = "Offering a Deal"
            switchCell.cellSwitch.on = hasDeals
            switchCell.delegate = self
            return switchCell
        case 1:
            var distanceCell = tableView.dequeueReusableCellWithIdentifier("DistanceCell", forIndexPath: indexPath) as! DistanceCell
            distanceCell.indexPath = indexPath
            distanceCell.textLabel?.text = distanceTitles[index]
            var accessoryType = (distanceIndex == index) ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
            distanceCell.accessoryType = accessoryType
            distanceCell.delegate = self
            return distanceCell
        case 2:
            var sortCell = tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath) as! SortCell
            sortCell.indexPath = indexPath
            sortCell.textLabel?.text = sortOptionTitles[index]
            var accessoryType = (sortMode.rawValue == index) ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
            sortCell.accessoryType = accessoryType
            sortCell.delegate = self
            return sortCell;
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return distanceTitles.count
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
    
    func distanceCell(distanceCell: DistanceCell, didChangeSelectedIndex index: Int) {
        distanceIndex = index
        println(distanceIndex)
    }
    
    func sortCell(sortCell: SortCell, didChangeSelectedIndex index: Int) {
        sortMode = YelpSortMode(rawValue: index)!
        println(sortMode.rawValue)
    }
    
    class func distance(fromDistanceIndex index: Int) -> Double {
        var miles: Double = 0.0
        switch index {
        case 0:
            miles = 0.25
        case 1:
            miles = 0.5
        case 2:
            miles = 1
        case 3:
            miles = 2
        case 4:
            miles = 5
        default:
            miles = 0
        }
        let metersPerMile = 1609.34
        return miles * metersPerMile
    }
}
