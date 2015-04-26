//
//  FiltersViewController.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String: AnyObject])
}

class FiltersViewController: UIViewController {
    
    // MARK: - Data
    
    weak var delegate: FiltersViewControllerDelegate?
    
    var hasDeals: Bool {
        didSet {
            filtersDataSource.hasDeals = hasDeals
        }
    }
    
    var filtersDataSource: FiltersDataSource!

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - UIViewController
    
    required init(coder aDecoder: NSCoder) {
        hasDeals = false
        filtersDataSource = FiltersDataSource()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = UIBarStyle.Black

        tableView.dataSource = filtersDataSource
        tableView.registerNib(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: "SwitchCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func onCancelTouched(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSearchTouched(sender: AnyObject) {
        
        var filters = [String: AnyObject]()
        filters["hasDeals"] = filtersDataSource.hasDeals
        delegate?.filtersViewController?(self, didUpdateFilters: filters)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
