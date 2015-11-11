//
//  CoreDataExporter.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 10/12/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import CoreData

class SLCoreDataExporter {
    private let dataController: SLCoreDataController
    
    init(dataController: SLCoreDataController) {
        self.dataController = dataController
    }
    
    // Export NSManagedObjects from CoreData
    
    //MARK: - Public
    func listItemsForProductList(productList: SLProductListEntity) -> [SLListItemEntity] {
        let fetchRequest = NSFetchRequest(entityName: "ListItem")
        fetchRequest.predicate = NSPredicate(format: "productList == %@", productList)
        var listItems = [SLListItemEntity]()
        self.dataController.performAndWaitOnMainContext { (context) -> Void in
            do {
                listItems = try context.executeFetchRequest(fetchRequest) as! [SLListItemEntity]
            } catch {
                // I sware we'll catch it out later. Again.
            }
        }
        return listItems
    }
    
    func unsassignedListItems() -> [SLListItemEntity] {
        let fetchRequest = NSFetchRequest(entityName: "ListItem")
        fetchRequest.predicate = NSPredicate(format: "productList == %@", argumentArray: nil)
        var listItems = [SLListItemEntity]()
        self.dataController.performAndWaitOnMainContext { (context) -> Void in
            do {
                listItems = try context.executeFetchRequest(fetchRequest) as! [SLListItemEntity]
            } catch {
                // I sware we'll catch it out later. Again.
            }
        }
        return listItems
    }
    
    func exportAllProductsLists() -> [SLProductListEntity] {
        let fetchRequest = NSFetchRequest(entityName: "ProductList")
        var productLists = [SLProductListEntity]()
        self.dataController.performAndWaitOnMainContext { (context) -> Void in
            do {
                productLists = try context.executeFetchRequest(fetchRequest) as! [SLProductListEntity]
            } catch {
                // I sware we'll catch it out later.
            }
        }
        return productLists
    }
    
    func exportCategories() -> [SLCategoryEntity] {
        let fetchRequest = NSFetchRequest(entityName: "Category")
        var categories = [SLCategoryEntity]()
        self.dataController.performAndWaitOnMainContext { (context) -> Void in
            do {
                categories = try context.executeFetchRequest(fetchRequest) as! [SLCategoryEntity]
            } catch {
                // I sware we'll catch it out later.
            }
        }
        return categories
    }
    
    func productsForCategory(category: SLCategoryEntity) -> [SLProductEntity] {
        let fetchRequest = NSFetchRequest(entityName: "Product")
        fetchRequest.predicate = NSPredicate(format: "category == %@", category)
        var products = [SLProductEntity]()
        self.dataController.performAndWaitOnMainContext { (context) -> Void in
            do {
                products = try context.executeFetchRequest(fetchRequest) as! [SLProductEntity]
            } catch {
                // I sware we'll catch it out later. Again.
            }
        }
        return products
    }
}
