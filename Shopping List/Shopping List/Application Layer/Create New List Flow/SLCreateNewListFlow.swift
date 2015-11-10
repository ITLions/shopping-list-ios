//
//  CreateNewListFlow.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLCreateNewListFlow: SLFlowProtocol {
    let navigationController: UINavigationController
    let initialViewController: SLCategoryPickerViewController
    
    internal var coreDataExporter: SLCoreDataExporter?
    internal var coreDataController: SLCoreDataController?
    internal var networkService: SLNetworkService?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let storyboard: UIStoryboard = UIStoryboard.init(name: "CreateNewListFlow", bundle: nil)
        self.initialViewController = storyboard.instantiateInitialViewController() as! SLCategoryPickerViewController
        self.initialViewController.viewModel = SLCategoryPickerViewModel()
    }
    
    func start() {
        self.initialViewController.viewModel.coreDataExporter = self.coreDataExporter
        self.initialViewController.viewModel.networkService = self.networkService
        self.initialViewController.viewModel.reloadData()
        
        if self.coreDataController != nil {
            self.coreDataController!.subscribeListenerForDatabaseChanges(self.initialViewController.viewModel) // TODO: unsubscribe it somewhere else
        } else {
            // handle error
        }
        
        self.navigationController.pushViewController(self.initialViewController, animated: true)
    }
}
