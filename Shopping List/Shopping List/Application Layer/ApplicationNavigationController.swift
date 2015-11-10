//
//  ApplicationNavigationController.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 11/10/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class ApplicationNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = ApplicationColor.primaryColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:ApplicationColor.textColor()]
        UINavigationBar.appearance().tintColor = ApplicationColor.textColor()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
