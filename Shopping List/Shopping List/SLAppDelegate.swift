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
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
}

