//
//  CoreDataExporter.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 10/12/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation

class SLCoreDataExporter: NSObject {
    private let dataController: SLCoreDataController!
    
    init(dataController: SLCoreDataController) {
        self.dataController = dataController
    }
    
    // Export NSManagedObjects from CoreData
    func listItemsForProductList(productList: SLProductListEntity) -> [SLListItemEntity] {
        return [SLListItemEntity()]
    }
}
