//
//  CoreDataController.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 10/12/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import Foundation
import CoreData

protocol SLCoreDataControllerListener { // to subscribe and unsubscribe from db cahnges
    func databaseDidChangeState()
}

class SLCoreDataController: NSObject {
    private let mainContext : NSManagedObjectContext!
    private let listeners : NSHashTable!
    
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
        
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: documentURL, options: nil)
            
            // set up context's configuration
            self.mainContext = NSManagedObjectContext.init(concurrencyType: .MainQueueConcurrencyType)
            self.mainContext.persistentStoreCoordinator = persistentStoreCoordinator
        } catch {
            print("Core data went wrong. You are dummy")
            abort()
        }
        /* Listeners */
        self.listeners = NSHashTable.weakObjectsHashTable()
    }
    
    // set up perform methods
    // error handling
    // asserts
    
    //MARK: - Public Notifications
    
    internal func subscribeListenerForDatabaseChanges <Listener where Listener: SLCoreDataControllerListener, Listener: AnyObject> (newListener: Listener) {
        self.listeners.addObject(newListener)
        NSNotificationCenter.defaultCenter().addObserver(newListener, selector: "databaseDidChangeState", name: NSManagedObjectContextDidSaveNotification, object: self.mainContext)
    }
    
    internal func unsubscribeListenerForDatabaseChanges <Listener where Listener: SLCoreDataControllerListener, Listener: AnyObject> (oldListener: Listener) {
        self.listeners.removeObject(oldListener)
        NSNotificationCenter.defaultCenter().removeObserver(oldListener, name: NSManagedObjectContextDidSaveNotification, object: self.mainContext)
    }
    
    // MARK: - Public Context Performance
    
    internal func performOnMainContext(performBlock: (context: NSManagedObjectContext) -> Void) {
        self.mainContext.performBlock { () -> Void in
            performBlock(context: self.mainContext)
            
            do {
                try self.mainContext.save()
            } catch {
                print("Save error")
                
            }
        }
    }
    
    internal func performAndWaitOnMainContext(performBlock: (context: NSManagedObjectContext) -> Void) {
        self.mainContext.performBlockAndWait { () -> Void in
            performBlock(context: self.mainContext)
            
            do {
                try self.mainContext.save()
            } catch {
                print("Save error")
            }
        }
    }
    
    internal func performOnTemporaryContext(performBlock: (context: NSManagedObjectContext) -> Void) {
        let tempContext = NSManagedObjectContext.init(concurrencyType: .PrivateQueueConcurrencyType)
        tempContext.persistentStoreCoordinator = self.mainContext.persistentStoreCoordinator
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSave:", name: NSManagedObjectContextDidSaveNotification, object: tempContext)
    
        tempContext.performBlock { () -> Void in
            performBlock(context: tempContext)
            
            NSNotificationCenter.defaultCenter().removeObserver(self, name: NSManagedObjectContextDidSaveNotification, object: tempContext)
        }
    }
    
    // MARK: - Private Context Performance
    
    private func contextDidSave(notification: NSNotification) {
        self.mainContext.performBlock { () -> Void in
            self.mainContext.mergeChangesFromContextDidSaveNotification(notification)
        }
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NSManagedObjectContextDidSaveNotification, object: notification.object)
    }
    
}
