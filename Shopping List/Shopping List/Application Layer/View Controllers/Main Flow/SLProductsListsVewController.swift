//
//  ProductsListsVewController.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLProductsListsVewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var viewModel: SLProductsListsViewModel!
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // send reference to vc into flow object
    }
    
    @IBAction func addBarItemAction(sender: AnyObject) {
        // send action to MainFlow
        // and start new Flow
    }
    
    // MARK: - Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.productsListsArray != nil {
            return self.viewModel.productsListsArray!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SLProductsListsCell", forIndexPath: indexPath) as UITableViewCell
        if self.viewModel.productsListsArray != nil {
            let productList: SLProductListEntity = self.viewModel.productsListsArray![indexPath.row]
            cell.textLabel?.text = productList.listName
        }
        
        return cell
    }
}
