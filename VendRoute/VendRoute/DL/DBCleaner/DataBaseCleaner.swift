//
//  DataBaseCleaner.swift
//  Arphys
//
//  Created by Vasili Orlov on 28/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import Amplify
import CoreData

protocol DataBaseCleaner {
  func clearUserTable()
}

class DataBaseCleanerImpl: DataBaseCleaner {
    let coreDataManager: CoraDataManager
    //data
    private lazy var context = coreDataManager.persistentContainer.newBackgroundContext()
    
    init(coreDataManager: CoraDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func clearUserTable() {
        deleteEntity(for: CoreVisit.self)
        deleteEntity(for: CorePOS.self)
        deleteEntity(for: CoreProduct.self)
        deleteEntity(for: CoreMeasure.self)
        coreDataManager.saveContext(context)
    }
    
    private func allCpEntities<T: NSManagedObject>(for entity: T.Type) -> [T] {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "\(T.self)")
        do {
            let entities = try context.fetch(fetchRequest) as! [T]
            return entities
        } catch {
            return [T]()
        }
    }
    
    func deleteEntity<T: NSManagedObject>(for entity:T.Type) {
        allCpEntities(for: T.self).forEach{ context.delete($0) }
    }
    
}
