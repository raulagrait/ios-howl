//
//  BusinessesDelegate.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class BusinessesDelegate: NSObject, UITableViewDelegate {
    
    
    // To be placed in your UITableViewDelegate.
    //
    // This is doing what autolayout *should* be doing which using the constraints to determine cell
    // height as needed. Currently, even with correctly setting prefferedMaxLayoutWidth on
    // labels within cells, heights calculated correctly at all times.
    
    // This is causing a stack overflow, so disabling it for now
    /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let contentView: UIView = tableView.dataSource!.tableView(tableView, cellForRowAtIndexPath: indexPath)
        contentView.updateConstraintsIfNeeded()
        contentView.layoutIfNeeded()
        return contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
    }
    */

}
