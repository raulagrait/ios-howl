//
//  BusinessesViewController.swift
//  Howl
//
//  Created by Raul Agrait on 4/24/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, FiltersViewControllerDelegate {
    
    // MARK: - Data
    
    var searchTerm: String! {
        didSet {
            load()
        }
    }
    
    var hasDeals: Bool! {
        didSet {
            load()
        }
    }
    
    var businessesDataSource: BusinessesDataSource!

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Views
    
    var searchBar: UISearchBar!

    // MARK: - UIViewController
    
    required init(coder aDecoder: NSCoder) {
        searchTerm = ""
        hasDeals = false
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        initializeSearchBar()
        
        businessesDataSource = BusinessesDataSource()
        tableView.dataSource = businessesDataSource
        
        tableView.delegate = self
        
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
    }
    
    // MARK: - Networking
    
    func load() {
        Business.searchWithTerm(searchTerm, sort: .Distance, categories: nil, deals: hasDeals) { (businesses: [Business]?, error: NSError!) -> Void in
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
    
    // MARK: - FiltersViewControllerDelegate
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        if let hasDeals = filters["hasDeals"] as? Bool {
            self.hasDeals = hasDeals
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        var navigationController = segue.destinationViewController as! UINavigationController
        var filtersViewController = navigationController.topViewController as! FiltersViewController
        filtersViewController.delegate = self
        filtersViewController.hasDeals = hasDeals
        
        // Pass the selected object to the new view controller.
    }

}
