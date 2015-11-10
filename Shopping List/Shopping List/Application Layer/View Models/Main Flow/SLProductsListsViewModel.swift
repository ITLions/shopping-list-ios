//
//  SLProductsListsViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

class SLProductsListsViewModel: SLCoreDataControllerListener {
    var productsListsArray: [SLProductListEntity]?
    var coreDataExporter: SLCoreDataExporter?
    var networkService: SLNetworkService?
    
    //MARK: Data Processing
    func reloadData() {
        if self.coreDataExporter != nil {
            self.productsListsArray = self.coreDataExporter!.exportAllProductsLists()
            // maybe we need prepare data before display it in cell
        } else {
            // handle error
        }
    }
    
    func databaseDidChangeState() {
        self.reloadData()
    }
}
