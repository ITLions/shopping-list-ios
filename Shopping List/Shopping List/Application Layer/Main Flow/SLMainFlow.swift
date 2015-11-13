//
//  MainFlow.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLMainFlow: SLFlowProtocol {
    private let initialViewController: SLProductsListsVewController
    private let navigationController: UINavigationController
    private let coreDataExporter: SLCoreDataExporter
    private let coreDataController: SLCoreDataController
    private let networkService: SLNetworkService
    
    required init(navigationController: UINavigationController, coreDataExporter: SLCoreDataExporter, coreDataController: SLCoreDataController, networkService: SLNetworkService) {
        self.navigationController = navigationController
        
        self.coreDataExporter = coreDataExporter
        self.coreDataController = coreDataController
        self.networkService = networkService
        
        let storyboard: UIStoryboard = UIStoryboard.init(name: "MainFlow", bundle: nil)
        self.initialViewController = storyboard.instantiateInitialViewController() as! SLProductsListsVewController
        self.initialViewController.viewModel = SLProductsListsViewModel(coreDataExporter: self.coreDataExporter, networkService: self.networkService)
    }
    
    func start() {
        if let viewModel = self.initialViewController.viewModel {
            viewModel.reloadData()
            self.coreDataController.coreDataDidChange.next({ (_) -> () in
                viewModel.reloadData()
            })
        }
        
        self.initialViewController.addNewListAction = { () -> Void in
            self.performAddAction()
        }
        
        if (self.navigationController.topViewController != nil) {
            self.navigationController.pushViewController(self.initialViewController, animated: true)
        } else {
            self.navigationController.viewControllers = [self.initialViewController]
        }
    }
    
    func performAddAction() {
        let createNewListFlow: SLCreateNewListFlow = SLCreateNewListFlow(navigationController: self.navigationController, coreDataExporter: self.coreDataExporter, coreDataController: self.coreDataController, networkService: self.networkService)
        createNewListFlow.start()
    }
}
