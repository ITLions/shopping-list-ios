//
//  SLProductsListsViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLProductsListsViewModel: NSObject, SLCoreDataControllerListener {
    var productsListsArray: [SLProductListEntity]?
    var coreDataExporter: SLCoreDataExporter?
    var networkService: SLNetworkService?
    
    //MARK: Data Processing
    internal func reloadData() {
        if self.coreDataExporter != nil {
            self.productsListsArray = self.coreDataExporter!.exportAllProductsLists()
        } else {
            // handle error
        }
    }
    
    func databaseDidChangeState() {
        self.reloadData()
    }
}
