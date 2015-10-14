//
//  SLRequestSerialization.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 14/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLRequestSerialization: NSObject {
    init(url: NSURL, method: String, parameters: NSObject) {
        super.init()
    }
    
    internal func buildRequest() -> NSURLRequest {
        return NSURLRequest()
    }
}
