//
//  FiltersDelegate.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

@objc protocol SortModeDelegate {
    optional func SortMode(didChangeIndex index: Int)
}

class FiltersTableViewDelegate: NSObject, UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 1 || indexPath.section == 2 {
            tableView.reloadData()
        }
    }
    
}
