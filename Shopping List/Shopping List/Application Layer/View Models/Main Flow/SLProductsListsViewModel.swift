//
//  SLProductsListsViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

class SLProductsListsViewModel: SLCoreDataControllerListener {
    var productsListsArray: [SLProductListEntity]?
    
    private let coreDataExporter: SLCoreDataExporter
    private let networkService: SLNetworkService
    
    init(coreDataExporter: SLCoreDataExporter, let networkService: SLNetworkService) {
        self.coreDataExporter = coreDataExporter
        self.networkService = networkService
    }
    
    //MARK: Data Processing
    func reloadData() {
        self.productsListsArray = self.coreDataExporter.exportAllProductsLists()
        // maybe we need prepare data before display it in cell
    }
    
    func databaseDidChangeState() {
        self.reloadData()
    }
}
