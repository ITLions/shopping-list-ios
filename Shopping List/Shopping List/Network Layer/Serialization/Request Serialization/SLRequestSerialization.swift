//
//  SLRequestSerialization.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 14/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation

class SLRequestSerialization {
    let url: NSURL
    let method: String
    let parameters: AnyObject
    
    init(url: NSURL, method: String, parameters: AnyObject) {
        self.url = url
        self.method = method
        self.parameters = parameters
    }
    
    internal func buildRequest() -> NSURLRequest {
        // add params to GET request here
        return NSURLRequest(URL: self.url)
    }
}
