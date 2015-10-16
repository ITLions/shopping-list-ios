//
//  MainFlow.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLMainFlow: NSObject, SLFlowProtocol {
    let navigationController: UINavigationController
    let initialViewController: SLProductsListsVewController
    
    internal var coreDataExporter: SLCoreDataExporter?
    internal var coreDataController: SLCoreDataController?
    internal var networkService: SLNetworkService?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let storyboard: UIStoryboard = UIStoryboard.init(name: "MainFlow", bundle: nil)
        self.initialViewController = storyboard.instantiateInitialViewController() as! SLProductsListsVewController
        self.initialViewController.viewModel = SLProductsListsViewModel()
        
        super.init()
    }
    
    func start() {
        self.initialViewController.viewModel.coreDataExporter = self.coreDataExporter
        self.initialViewController.viewModel.networkService = self.networkService
        self.initialViewController.viewModel.reloadData()
        
        if self.coreDataController != nil {
            self.coreDataController!.subscribeListenerForDatabaseChanges(self.initialViewController.viewModel)
        } else {
            // handle error
        }
        
        if (self.navigationController.topViewController != nil) {
            self.navigationController.pushViewController(self.initialViewController, animated: true)
        } else {
            self.navigationController.viewControllers = [self.initialViewController]
        }
    }
}
