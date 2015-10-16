//
//  SLNetworkService.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLNetworkService: NSObject {
    private let operationQueue: NSOperationQueue
    private let coreDataImporter: SLCoreDataImporter
    
    init(coreDataImporter: SLCoreDataImporter) {
        self.operationQueue = NSOperationQueue.init()
        self.operationQueue.name = "SLNetworkService"
        self.coreDataImporter = coreDataImporter
        super.init()
    }
    
    internal func performNetworkOperation(operation: SLNetworkOperation) {
        operation.completionHandler = { (responseData, response) -> Void in
            let responseSerialization: SLResponseSerialization = SLResponseSerialization.init(coreDataImporter: self.coreDataImporter)
            responseSerialization.parseResponseData(response, responseData: responseData)
        }
        self.operationQueue.addOperation(operation)
    }
    
    internal func cancelAllOperations() {
        self.operationQueue.cancelAllOperations()
    }
}
