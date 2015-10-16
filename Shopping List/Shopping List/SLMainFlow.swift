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
    
    internal var coreDataExporter: SLCoreDataExporter?
    internal var networkService: SLNetworkService?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let storyboard: UIStoryboard = []
        
        super.init()
    }
    
    func start() {
        
    }
}
