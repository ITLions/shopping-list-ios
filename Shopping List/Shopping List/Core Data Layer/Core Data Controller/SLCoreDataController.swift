//
//  CoreDataController.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 10/12/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation
import CoreData

class SLCoreDataController : NSObject /* It is for notifications */ {
    private let mainContext : NSManagedObjectContext
    
    let coreDataDidChange = Signal<AnyObject>()
    
    //MARK: - Private
    
    // set up connection to xcdatamodel
    override init() {
        /* setup NSManagedObjectModel */
        let modelURL = NSBundle.mainBundle().URLForResource("Shopping_List", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)!
        
        /* setup NSPersistentStoreCoordinator */
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let documentURLS: [AnyObject] = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentURL = documentURLS.last!.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        
        if let documemtPath = documentURL.path {
            let fileManager = NSFileManager.defaultManager()
            if fileManager.fileExistsAtPath(documemtPath) == false {
                let defaultStorePath = NSBundle.mainBundle().pathForResource("SingleViewCoreData", ofType: "sqlite")
                if let actPath = defaultStorePath {
                    do {
                        try fileManager.copyItemAtPath(actPath, toPath: documemtPath)
                    } catch {
                        print("Cant preload DB")
                    }
                }
            }
        } else {
            print("cant convert path")
        }
        
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: documentURL, options: nil)
            
            // set up context's configuration
            self.mainContext = NSManagedObjectContext.init(concurrencyType: .MainQueueConcurrencyType)
            self.mainContext.persistentStoreCoordinator = persistentStoreCoordinator
        } catch {
            print("Core data went wrong. You are dummy")
            abort()
        }
        super.init()
    }
    
    // MARK: - Public Context Performance
    
    func performOnMainContext(performBlock: (context: NSManagedObjectContext) -> Void) {
        self.mainContext.performBlock { () -> Void in
            performBlock(context: self.mainContext)
            do {
                try self.mainContext.save()
            } catch {
                print("Save error")
            }
        }
    }
    
    func performAndWaitOnMainContext(performBlock: (context: NSManagedObjectContext) -> Void) {
        self.mainContext.performBlockAndWait { () -> Void in
            performBlock(context: self.mainContext)
            do {
                try self.mainContext.save()
            } catch {
                print("Save error")
            }
        }
    }
    
    func performOnTemporaryContext(performBlock: (context: NSManagedObjectContext) -> Void) {
        let tempContext = NSManagedObjectContext.init(concurrencyType: .PrivateQueueConcurrencyType)
        tempContext.persistentStoreCoordinator = self.mainContext.persistentStoreCoordinator
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSave:", name: NSManagedObjectContextDidSaveNotification, object: tempContext)
    
        tempContext.performBlock { () -> Void in
            performBlock(context: tempContext)
            
            NSNotificationCenter.defaultCenter().removeObserver(self, name: NSManagedObjectContextDidSaveNotification, object: tempContext)
        }
    }
    
    // MARK: - Private Context Performance
    
    func contextDidSave(notification: NSNotification) {
        self.mainContext.performBlock { () -> Void in
            self.mainContext.mergeChangesFromContextDidSaveNotification(notification)
        }
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NSManagedObjectContextDidSaveNotification, object: notification.object)
    }
}
