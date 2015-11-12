//
//  SLFlowProtocol.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 11/11/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

protocol SLFlowProtocol {
    init(navigationController: UINavigationController, coreDataExporter: SLCoreDataExporter, coreDataController: SLCoreDataController, networkService: SLNetworkService)
    
    func start()
}
