//
//  SLProductPickerViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

class SLProductPickerViewModel {
    let products: [SLProductEntity]
    
    init(category: SLCategoryEntity, coreDataExporter: SLCoreDataExporter) {
        self.products = coreDataExporter.productsForCategory(category)
    }
}
