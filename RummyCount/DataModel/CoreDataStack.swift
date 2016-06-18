//
//  DataController.swift
//  RummyCount
//
//  Created by Venkata Mandala on 18/06/2016.
//  Copyright © 2016 Ramana Reddy. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStack: NSObject {

    static let modelName = "RummyCount"
    
    func saveMainContext() {
        if managedObjectContext.hasChanges {
            do{
                try managedObjectContext.save()
            } catch {
                fatalError("Error saving main object context \(error)")
            }
        }
    }
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelUrl = NSBundle.mainBundle().URLForResource(modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL:modelUrl)!
    }()
    
    lazy var applicationDocumentsDirectory : NSURL = {
       return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).last!
    }()
    
    lazy var persistentCooridinator: NSPersistentStoreCoordinator = {
        let cooridinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let persistantStoreURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent("\(modelName).sqlite")
        
        do {
            try cooridinator.addPersistentStoreWithType(NSSQLiteStoreType,
                                                        configuration: nil,
                                                        URL:persistantStoreURL,
                                                        options:[NSMigratePersistentStoresAutomaticallyOption:true,
                                                            NSInferMappingModelAutomaticallyOption:true])
            } catch {
                fatalError("Persistent Store Error \(error)")
            }
        return cooridinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
       let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentCooridinator
        return managedObjectContext
    }()
}
