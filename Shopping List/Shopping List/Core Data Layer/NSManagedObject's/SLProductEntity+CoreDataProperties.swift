//
//  SLProductEntity+CoreDataProperties.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 11/13/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SLProductEntity {

    @NSManaged var productDescription: String?
    @NSManaged var productIcon: String?
    @NSManaged var productId: String?
    @NSManaged var productName: String?
    @NSManaged var category: SLCategoryEntity?
    @NSManaged var listItem: NSSet?
    @NSManaged var units: NSSet?

}
