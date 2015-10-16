//
//  SLNetworkOperation.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 14/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLNetworkOperation: NSOperation {
    private let requestSerialization: SLRequestSerialization
    var completionHandler: ((NSData, NSURLResponse) -> Void)?
    
    init(requestSerialization: SLRequestSerialization) {
            self.requestSerialization = requestSerialization
            super.init()
    }

    override func main() {
        // create NSURLSession
        // get request from RS
        // wait for execution
        // prepare response serialization
        let session: NSURLSession = NSURLSession.sharedSession()
        if (self.requestSerialization.method == "GET") {
            session.dataTaskWithRequest(self.requestSerialization.buildRequest(),
                completionHandler: { (responseData, response, error) -> Void in
                    if error == nil {
                        // handle response
                        if self.completionHandler != nil {
                            if (responseData != nil && response != nil) {
                                self.completionHandler!(responseData!, response!)
                            } else {
                                // handle error to get data
                            }
                        } else {
                            assertionFailure("set completion handler before operation call")
                        }
                    } else {
                        // handle error
                    }
            })
        }
    }
}
