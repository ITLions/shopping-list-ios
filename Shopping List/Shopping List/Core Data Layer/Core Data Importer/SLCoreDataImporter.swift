//
//  CoreDataMapper.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 10/12/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation

class SLCoreDataImporter: NSObject {
    private var dataController: SLCoreDataController! // own data controller to approach data base
    // list of methods to create nsmanagedobjects from dictionaries
    // insert them into context after
    // error handling
    // tests
    
    internal func importProductList(listName: String) -> SLProductListEntity {
        return SLProductListEntity();
    }
    
    internal func deleteProductList(productList: SLProductListEntity) {
        
    }
}
