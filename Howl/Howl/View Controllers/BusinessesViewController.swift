//
//  BusinessesViewController.swift
//  Howl
//
//  Created by Raul Agrait on 4/24/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Data
    
    var searchTerm: String!
    var businessesDataSource: BusinessesDataSource!

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Views
    
    var searchBar: UISearchBar!

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        searchTerm = ""
        initializeSearchBar()
        
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


    func initializeSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        println(searchBar.text)
        searchTerm = searchBar.text
        load()
    }
    
    // MARK: - Networking
    
    func load() {
        Business.searchWithTerm(searchTerm, sort: .Distance, categories: nil, deals: false) { (businesses: [Business]?, error: NSError!) -> Void in
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
