//
//  SLCategoryPickerViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLCategoryPickerViewModel: NSObject, SLCoreDataControllerListener {
    var coreDataExporter: SLCoreDataExporter?
    var networkService: SLNetworkService?
    
    internal func reloadData() {
        
    }
    
    func databaseDidChangeState() {
        
    }
}
