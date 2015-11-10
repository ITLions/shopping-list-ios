//
//  SLNetworkService.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation

class SLNetworkService {
    private let operationQueue: NSOperationQueue
    private let coreDataImporter: SLCoreDataImporter
    
    init(coreDataImporter: SLCoreDataImporter) {
        self.operationQueue = NSOperationQueue()
        self.operationQueue.name = "SLNetworkService"
        self.coreDataImporter = coreDataImporter
    }
    
    func performNetworkOperation(operation: SLNetworkOperation) {
        self.operationQueue.addOperation(operation)
    }
    
    func cancelAllOperations() {
        self.operationQueue.cancelAllOperations()
    }
}