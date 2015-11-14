//
//  CreateNewListFlow.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLCreateNewListFlow: SLFlowProtocol {
    let initialViewController: SLCategoryPickerViewController
    
    private let navigationController: UINavigationController
    private let coreDataExporter: SLCoreDataExporter
    private let coreDataController: SLCoreDataController
    private let networkService: SLNetworkService

    required init(navigationController: UINavigationController, coreDataExporter: SLCoreDataExporter, coreDataController: SLCoreDataController, networkService: SLNetworkService) {
        self.navigationController = navigationController
        
        self.coreDataExporter = coreDataExporter
        self.coreDataController = coreDataController
        self.networkService = networkService
        
        let storyboard: UIStoryboard = UIStoryboard.init(name: "CreateNewListFlow", bundle: nil)
        self.initialViewController = storyboard.instantiateInitialViewController() as! SLCategoryPickerViewController
        self.initialViewController.viewModel = SLCategoryPickerViewModel(coreDataExporter: self.coreDataExporter)
    }
    
    func start() {
        self.navigationController.pushViewController(self.initialViewController, animated: true)
    }
}
