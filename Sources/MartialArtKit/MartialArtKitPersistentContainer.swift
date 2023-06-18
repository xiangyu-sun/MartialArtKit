//
//  MartialArtKitPersistentContainer.swift
//  Taichi
//
//  Created by 孙翔宇 on 05/09/2019.
//  Copyright © 2019 xiangyu sun. All rights reserved.
//

import CoreData

public final class MartialArtKitPersistentContainer: NSPersistentContainer {
    
    override public class func defaultDirectoryURL() -> URL {
         guard let storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.martial.art")
            else {
                fatalError("failed to create database")
        }
         return storeURL
     }
  
  
}
