//
//  YelpClient.swift
//  Howl
//
//  Created by Raul Agrait on 4/22/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import Foundation
import UIKit

enum YelpSortMode: Int {
    case BestMatched = 0
    case Distance = 1
    case HighestRated = 2
}

let yelpConsumerKey = "EhjbRRqPdchuDqrGIWFKSA"
let yelpConsumerSecret = "QVEnyWOxcQrCfxBz5I1nY3nMlDw"
let yelpToken = "Hh_SVXWjANvrjqq_XFtcwhiZHTZk878H"
let yelpTokenSecret = "o6H2M1xDOb7EFpa7HQ5T7sfSS5Q"

class YelpClient: BDBOAuth1RequestOperationManager {

    static let sharedInstance = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
    
    var accessToken: String!
    var accessSecret: String!
        
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
        self.accessToken = accessToken
        self.accessSecret = accessSecret
        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret)
        
        var token = BDBOAuth1Credential(token: accessToken, secret: accessSecret, expiration: nil)
        requestSerializer.saveAccessToken(token)
    }

    func searchWithTerm(term: String, completion: ([Business]!, NSError!) -> Void) -> AFHTTPRequestOperation {
        return searchWithTerm(term, sort: nil, categories: nil, deals: nil, distance: nil, completion: completion)
    }
    
    func searchWithTerm(term: String, sort: YelpSortMode?, categories: [String]?, deals: Bool?, distance: Double?, completion: ([Business]!, NSError!) -> Void) -> AFHTTPRequestOperation {
        
        // Default the location to San Francisco
        var parameters: [String: AnyObject] = ["term": term, "ll": "37.785771,-122.406165"]
        
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        
        if let categories = categories {
            if categories.count > 0 {
                parameters["category_filter"] = ",".join(categories)
            }
        }
    
        if let deals = deals {
            parameters["deals_filter"] = deals
        }
        
        if let distance = distance {
            parameters["radius_filter"] = distance
        }
        
        println(parameters)
        
        return self.GET("search", parameters: parameters, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            if let dictionaries = response["businesses"] as? [NSDictionary] {
                var businesses = Business.businesses(dictionaries)
                completion(businesses, nil)
            }
            }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
                completion(nil, error)
        })
    }
}