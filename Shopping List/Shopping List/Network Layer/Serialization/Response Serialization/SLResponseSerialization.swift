//
//  SLResponseSerialization.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 14/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation

class SLResponseSerialization {
    private let coreDataImporter: SLCoreDataImporter!
    private var mappingObject: NSDictionary?
    
    init(coreDataImporter: SLCoreDataImporter) {
        self.coreDataImporter = coreDataImporter
    }
    
    func parseResponseData(response: NSURLResponse, responseData: NSData) {
        do {
            let responseDictionary: NSDictionary = try NSJSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments) as! NSDictionary
            if let mappingObject = self.mappingObject {
                self.importParsedData(mappingObject, parsedData: responseDictionary)
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
