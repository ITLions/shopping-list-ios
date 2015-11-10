//
//  SLNetworkOperation.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 14/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation

class SLNetworkOperation: NSOperation {
    private let requestSerialization: SLRequestSerialization
    private let responseSerialization: SLResponseSerialization
    
    init(requestSerialization: SLRequestSerialization, responseSerialization: SLResponseSerialization) {
        self.requestSerialization = requestSerialization
        self.responseSerialization = responseSerialization
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
                        if response != nil && responseData != nil {
                            self.responseSerialization.parseResponseData(response!, responseData: responseData!)
                        }
                    } else {
                        // handle error
                    }
            })
        }
    }
}