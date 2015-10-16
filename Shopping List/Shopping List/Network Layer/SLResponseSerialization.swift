//
//  SLResponseSerialization.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 14/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLResponseSerialization: NSObject {
    private let coreDataImporter: SLCoreDataImporter!
    
    init(coreDataImporter: SLCoreDataImporter) {
        self.coreDataImporter = coreDataImporter
        super.init()
    }
    
    func parseResponseData(response: NSURLResponse, responseData: NSData) {
        
    }
    
    private func importParsedData(mappingObject: AnyObject, parsedData: AnyObject) {
        
    }
}
