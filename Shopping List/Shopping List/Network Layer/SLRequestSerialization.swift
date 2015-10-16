//
//  SLRequestSerialization.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 14/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLRequestSerialization: NSObject {
    private  var url: NSURL
    internal var method: String
    internal var parameters: AnyObject
    
    init(url: NSURL, method: String, parameters: AnyObject) {
        self.url = url
        self.method = method
        self.parameters = parameters
        super.init()
    }
    
    internal func buildRequest() -> NSURLRequest {
        // add params to GET request here
        return NSURLRequest.init(URL: self.url)
    }
}
