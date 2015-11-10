//
//  ProductsListsVewController.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLProductsListsVewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: SLProductsListsViewModel?
    var addNewListAction: (() -> Void)?
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // send reference to vc into flow object
    }
    
    @IBAction func addBarItemAction(sender: AnyObject) {
        // send action to MainFlow
        // and start new Flow
        if let addNewListAction = self.addNewListAction {
            addNewListAction()
        }
    }
    
    // MARK: - Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let productsListsArray = self.viewModel?.productsListsArray {
            return productsListsArray.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SLProductsListsCell", forIndexPath: indexPath) as UITableViewCell
        return cell
    }
}
