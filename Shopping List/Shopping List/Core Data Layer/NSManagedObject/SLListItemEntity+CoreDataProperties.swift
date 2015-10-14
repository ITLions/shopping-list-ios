//
//  SLListItemEntity+CoreDataProperties.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 10/12/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SLListItemEntity {

    @NSManaged var checked: NSNumber?
    @NSManaged var amount: NSNumber?
    @NSManaged var product: SLProductEntity?
    @NSManaged var productList: SLProductListEntity?

}
