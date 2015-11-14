//
//  SLCategoryPickerViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

class SLCategoryPickerViewModel {
    private let coreDataExporter: SLCoreDataExporter
    
    var categories: [SLCategoryEntity]
    
    init(coreDataExporter: SLCoreDataExporter) {
        self.coreDataExporter = coreDataExporter        
        self.categories = coreDataExporter.exportCategories()
    }
    
    func productPickerViewModel(index: Int) -> SLProductPickerViewModel {
        return SLProductPickerViewModel(category: self.categories[index], coreDataExporter: self.coreDataExporter)
    }
}
