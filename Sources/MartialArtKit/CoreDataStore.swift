//
//  CoreDataStore.swift
//  Taichi
//
//  Created by 孙翔宇 on 30/06/2019.
//  Copyright © 2019 xiangyu sun. All rights reserved.
//
import os
import CoreData

public final class CoreDataStore {
    public static let shared = CoreDataStore()
    
    public let persistentContainer: MartialArtKitPersistentContainer = {
      let container = MartialArtKitPersistentContainer(name: "Record", managedObjectModel: CoreDataStore.sharedManagedObjectModel)
        do {
            container.loadPersistentStores { (description, error) in
                if let error = error {
                   fatalError("Failed to load store: \(error)")
                 }
            }
            
            try container.viewContext.setQueryGenerationFrom(.current)
            os_log("core data loaded from: %@", MartialArtKitPersistentContainer.defaultDirectoryURL().absoluteString)
        } catch {
            fatalError()
        }
        
        return container
    }()
  
  
  // The managed object model can only be loaded once
  // per app invocation, so we load it here and reuse
  // the shared MoM each time a store is instantiated.
  static let sharedManagedObjectModel: NSManagedObjectModel = {
      #if SWIFT_PACKAGE
      let bundle = Bundle.module // Use the SPM package's module
      #else
      let bundle = Bundle(for: WorkoutSession.self)
      #endif
      let modelUrl = bundle.url(forResource: "Record", withExtension: "momd")!
      let mom = NSManagedObjectModel(contentsOf: modelUrl)!
      return mom
  }()
    
    public static func pruge() throws {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "WorkoutSession")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        let result = try shared.persistentContainer.viewContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
        
        let objectIDArray = result?.result as? [NSManagedObjectID]
        let changes = [NSDeletedObjectsKey : objectIDArray]
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes as [AnyHashable : Any], into: [shared.persistentContainer.viewContext])

    }
}
