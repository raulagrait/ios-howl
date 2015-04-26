//
//  BusinessesViewController.swift
//  Howl
//
//  Created by Raul Agrait on 4/24/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {
    
    // MARK: - Data
    
    var businessesDataSource: BusinessesDataSource!

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businessesDataSource = BusinessesDataSource()
        tableView.dataSource = businessesDataSource
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Networking
    
    func load() {
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["thai", "mexican"], deals: true) { (businesses: [Business]?, error: NSError!) -> Void in
            if let businesses = businesses {
                self.businessesDataSource.businesses = businesses
                self.tableView.reloadData()
                
                for business in businesses {
                    println("name = \(business.name) address = \(business.address)")
                }
            } else {
                println(error)
            }
        }
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
