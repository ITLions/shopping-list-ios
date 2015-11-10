//
//  SLCategoryPickerViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

class SLCategoryPickerViewModel: SLCoreDataControllerListener {
    private let coreDataExporter: SLCoreDataExporter
    private let networkService: SLNetworkService
    
    init(coreDataExporter: SLCoreDataExporter, networkService: SLNetworkService) {
        self.coreDataExporter = coreDataExporter
        self.networkService = networkService
    }
    
    func reloadData() {
        
    }
    
    func databaseDidChangeState() {
        
    }
}
