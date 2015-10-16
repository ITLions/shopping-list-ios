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
    private var mappingObject: NSDictionary?
    
    init(coreDataImporter: SLCoreDataImporter) {
        self.coreDataImporter = coreDataImporter
        super.init()
    }
    
    func parseResponseData(response: NSURLResponse, responseData: NSData) {
        do {
            let responseDictionary: NSDictionary = try NSJSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments) as! NSDictionary
            if self.mappingObject != nil {
                self.importParsedData(self.mappingObject!, parsedData: responseDictionary)
            }
        } catch {
            // handle errors
        }
    }
    
    private func importParsedData(mappingObject: NSDictionary, parsedData: NSDictionary) {
        // interface for write data into CD
        // override this method in subclasses
    }
}
