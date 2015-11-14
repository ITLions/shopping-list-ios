//
//  AppDelegate.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 12/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

@UIApplicationMain
class SLAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Setup dependences for application
        let coreDataController: SLCoreDataController = SLCoreDataController.init()
        let coreDataExporter: SLCoreDataExporter = SLCoreDataExporter.init(dataController: coreDataController)
        let coreDataImporter: SLCoreDataImporter = SLCoreDataImporter.init(dataController: coreDataController)
        let networkService: SLNetworkService = SLNetworkService.init(coreDataImporter: coreDataImporter)
        
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.window!.makeKeyAndVisible()
        let applicationNavigationController = ApplicationNavigationController()
        self.window!.rootViewController = applicationNavigationController
        
        let mainFlow: SLMainFlow = SLMainFlow(navigationController: applicationNavigationController, coreDataExporter: coreDataExporter, coreDataController: coreDataController, networkService: networkService)
        mainFlow.start()
    
        return true
    }
}

