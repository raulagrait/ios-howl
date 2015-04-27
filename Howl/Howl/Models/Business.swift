//
//  Business.swift
//  Howl
//
//  Created by Raul Agrait on 4/22/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import Foundation

class Business {
    var imageUrl: NSURL?
    var name: String?
    var ratingImageUrl: NSURL?
    var numReviews: String?
    var address: String?
    var categories: String?
    var distance: String?
    var reviewCount: NSNumber?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        
        if let imageUrlString = dictionary["image_url"] as? String {
            imageUrl = NSURL(string: imageUrlString)
        }
        
        initAddress(dictionary)
        initCategories(dictionary)
        initDistance(dictionary)
        initRatingImageUrl(dictionary)
        
        reviewCount = dictionary["review_count"] as? NSNumber
    }
    
    func initAddress(dictionary: NSDictionary) {
        var address = String()
        if let locationDictionary = dictionary["location"] as? NSDictionary {
            if let addressArray = locationDictionary["address"] as? NSArray {
                if addressArray.count > 0 {
                    address = addressArray[0] as! String
                }
            }
            
            if let neighborhoodsArray = locationDictionary["neighborhoods"] as? NSArray {
                if neighborhoodsArray.count > 0 {
                    if !address.isEmpty {
                        address += ", "
                    }
                    address += neighborhoodsArray[0] as! String
                }
            }
        }
        self.address = address
    }
    
    func initCategories(dictionary: NSDictionary) {
        if let categoriesArray = dictionary["categories"] as? [[String]] {
            var categoryNames = [String]()
            for category in categoriesArray {
                var categoryName = category[0]
                categoryNames.append(categoryName)
            }
            categories = ", ".join(categoryNames)
        }
    }
    
    func initDistance(dictionary: NSDictionary) {
        if let distanceMeters = dictionary["distance"] as? NSNumber {
            let milesPerMeter = 0.000621371
            distance = String(format: "%.2f mi", milesPerMeter * distanceMeters.doubleValue)
        }
    }
    
    func initRatingImageUrl(dictionary: NSDictionary) {
        if let ratingImageUrlString = dictionary["rating_img_url_large"] as? String {
            ratingImageUrl = NSURL(string: ratingImageUrlString)
        }
    }

    /// MARK: Class methods
    
    class func businesses(array: [NSDictionary]) -> [Business] {
        var businesses = [Business]()
        for businessDictionary in array {
            var business = Business(dictionary: businessDictionary)
            businesses.append(business)
        }
        return businesses
    }
    
    class func searchWithTerm(term: String, completion: ([Business]?, NSError!) -> Void) {
        YelpClient.sharedInstance.searchWithTerm(term, completion: completion)
    }
    
    class func searchWithTerm(term: String, sort: YelpSortMode?, categories: [String]?, deals: Bool?, distance: Double?, completion: ([Business]?, NSError!) -> Void) {
        YelpClient.sharedInstance.searchWithTerm(term, sort: sort, categories: categories, deals: deals, distance: distance, completion: completion)
    }
}