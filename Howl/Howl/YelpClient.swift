//
//  YelpClient.swift
//  Howl
//
//  Created by Raul Agrait on 4/22/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import Foundation
import UIKit

class YelpClient: BDBOAuth1RequestOperationManager {
    var accessToken: String!
    var accessSecret: String!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
        self.accessToken = accessToken
        self.accessSecret = accessSecret
        var baseUrl = NSURL(string: "http://api.yelp.com/v2")
        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret)
    }
}

/*

class YelpClient: BDBOAuth1RequestOperationManager {
var accessToken: String!
var accessSecret: String!

required init(coder aDecoder: NSCoder) {
super.init(coder: aDecoder)
}

init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
self.accessToken = accessToken
self.accessSecret = accessSecret
var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret);

var token = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil)
self.requestSerializer.saveAccessToken(token)
}

func searchWithTerm(term: String, success: (AFHTTPRequestOperation!, AnyObject!) -> Void, failure: (AFHTTPRequestOperation!, NSError!) -> Void) -> AFHTTPRequestOperation! {
// For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
var parameters = ["term": term, "location": "San Francisco"]
return self.GET("search", parameters: parameters, success: success, failure: failure)
}

}


*/