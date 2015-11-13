//
//  SLProductsListsViewModel.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

enum SLProductsListsViewModelState {
    case Loading
    case FinishLoading
}

class SLProductsListsViewModel {
    var productsListsArray: [SLProductListEntity]?
    
    let viewModelState: Signal<SLProductsListsViewModelState>
    
    private let coreDataExporter: SLCoreDataExporter
    private let networkService: SLNetworkService
    
    init(coreDataExporter: SLCoreDataExporter, let networkService: SLNetworkService) {
        self.coreDataExporter = coreDataExporter
        self.networkService = networkService
        
        self.viewModelState = Signal<SLProductsListsViewModelState>()
    }
    
    //MARK: Data Processing
    func reloadData() {
        self.viewModelState.fire(.Loading)
        self.productsListsArray = self.coreDataExporter.exportAllProductsLists()
        // maybe we need prepare data before display it in cell
        self.viewModelState.fire(.FinishLoading)
    }
    
    func removeProductList(index: Int) {
        self.productsListsArray?.removeAtIndex(index)
        if let list = self.productsListsArray {
            self.coreDataExporter.deleteProductList(list[index])
        }
    }
    
    func reviewListViewModel(index: Int) -> SLReviewListViewModel {
        if let list = self.productsListsArray {
            return SLReviewListViewModel(productList: list[index])
        }
        return SLReviewListViewModel(productList: SLProductListEntity()) //dummy one
    }
}
