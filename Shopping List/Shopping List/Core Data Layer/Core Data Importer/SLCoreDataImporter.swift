//
//  CoreDataMapper.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 10/12/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import CoreData

class SLCoreDataImporter {
    private var dataController: SLCoreDataController // own data controller to approach data base
    // list of methods to create nsmanagedobjects from dictionaries
    // insert them into context after
    // error handling
    // tests
    init(dataController: SLCoreDataController) {
        self.dataController = dataController
    }
    
    func importProductList(listName: String, listItems: [SLListItemEntity]) {
        self.dataController.performOnMainContext { (context) -> Void in
            let productList = NSEntityDescription.insertNewObjectForEntityForName("ProductList", inManagedObjectContext: context) as! SLProductListEntity
            productList.listName = listName
            productList.listItems = NSSet(array: listItems)
            productList.dateCreated = NSDate()
        }
    }
    
    func importListItem(amount: Int, product: SLProductEntity) {
        self.dataController.performAndWaitOnMainContext { (context) -> Void in
            let item = NSEntityDescription.insertNewObjectForEntityForName("ListItem", inManagedObjectContext: context) as! SLListItemEntity
            item.amount = amount
            item.product = product
        }
    }
}
